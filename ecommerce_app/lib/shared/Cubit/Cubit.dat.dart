import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/shared/Cubit/States.dart';
import 'package:ecommerce_app/shared/sharedPrf/helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyCubit extends Cubit<MyState> {
  MyCubit() : super(InitialState());
  static List products = [];

  static var user;
  Future signIn(email, password) async {
    emit(SignInLoadingState());
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((u) async {
      print(u.user!.email);
      await FirebaseFirestore.instance
          .collection("users")
          .doc(u.user!.uid)
          .get()
          .then(
        (value) async {
          user = value.data();
          await SharedPrefHelper.puData("isIn", 12).then((value) async {
            await SharedPrefHelper.puData("userUID", u.user!.uid);

            emit(SignInSuccess());
          });
        },
      );
    }).catchError((error) {
      Fluttertoast.showToast(
          msg:
              "${error.toString().substring(error.toString().indexOf("]") + 1)}",
          backgroundColor: Colors.red);
      emit(SignUpErrorState());
    });
  }

  Future signUp(email, password, name) async {
    emit(SignUpLoadingState());
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((u) async {
      print(u.user!.email);
      await FirebaseFirestore.instance.collection("users").doc(u.user!.uid).set(
        {"email": u.user!.email, "userName": name, "card items": []},
      ).then((value) async {
        await SharedPrefHelper.puData("isIn", 12).then((value) async {
          await SharedPrefHelper.puData("userUID", u.user!.uid);
          emit(SignUpSuccess());
        });
      });
    }).catchError((error) {
      Fluttertoast.showToast(
          msg:
              "${error.toString().substring(error.toString().indexOf("]") + 1)}",
          backgroundColor: Colors.red);
      emit(SignUpErrorState());
    });
  }

  Future getData() async {
    emit(GetDataLoadingState());
    if (SharedPrefHelper.getData("isIn") == 12) {
      print(SharedPrefHelper.getDataS("userUID"));
      await FirebaseFirestore.instance
          .collection("useres")
          .doc(SharedPrefHelper.getDataS("userUID"))
          .get()
          .then((value) {
        user = value.data();
        print(user);
      });
    }
    await FirebaseFirestore.instance.collection("products").get().then((value) {
      products = value.docs;
      emit(GetDataSuccessState());
    });
  }

  Future setComment(product, text, rating) async {
    emit(AddCommentLoading());
    product['comments']
        .add({"comment": text, "user": user["userName"], "rating": rating});
    print(product['comments']);
    await FirebaseFirestore.instance
        .collection("products")
        .doc(product["title"])
        .set({
      "comments": product["comments"],
      "image": product["image"],
      "price": product['price'],
      "title": product["title"],
      "type": product["type"]
    }).then((value) async {
      await getData().then((value) {
        emit(AddCommentSuccess());
      });
    }).catchError((e) {
      Fluttertoast.showToast(
          msg: "${e.toString().substring(e.toString().indexOf("]") + 1)}",
          backgroundColor: Colors.red);
    });
  }
}
