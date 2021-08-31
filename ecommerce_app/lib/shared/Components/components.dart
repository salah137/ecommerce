import 'package:ecommerce_app/Screens/Home/MobileHomeScreen.dart';
import 'package:ecommerce_app/Screens/Home/MobileProductScreen.dart';
import 'package:ecommerce_app/Screens/Login_and_Registre%20/DesktopLoginScreen.dart';
import 'package:ecommerce_app/Screens/Login_and_Registre%20/DesktopRegistreScreen.dart';
import 'package:ecommerce_app/Screens/Login_and_Registre%20/MobileLoginScreen.dart';
import 'package:ecommerce_app/Screens/Login_and_Registre%20/MobileRegistreScreen.dart';
import 'package:ecommerce_app/shared/Cubit/Cubit.dat.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

Widget textFieild({
  required TextEditingController controller,
  required String labelText,
  required String hint,
  required IconData icon,
  required validator,
  onChange,
  onSubmite,
  required bool isPassword,
}) {
  return Container(
    padding: EdgeInsets.all(10),
    child: TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        labelText: labelText,
        hintText: hint,
        prefixIcon: Icon(icon),
      ),
      controller: controller,
      validator: validator,
      onChanged: onChange,
      obscureText: isPassword,
      onFieldSubmitted: onSubmite,
    ),
  );
}

forLogin( ) {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  return Form(
    key: formKey,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "Sign In",
            style: TextStyle(
              fontSize: 30,
              fontFamily: "Schyler",
            ),
          ),
        ),
        textFieild(
          controller: email,
          labelText: "email",
          hint: "example@example.com",
          icon: Icons.email_outlined,
          validator: (String? v) {
            if (!v!.contains("@") || !v.contains(".com"))
              return "The email is badly formatted";
            else if (v.isEmpty || v == null) return "Please entre your email";
            return null;
          },
          isPassword: false,
        ),
        SizedBox(
          height: 20,
        ),
        textFieild(
          controller: password,
          labelText: "password",
          hint: "",
          icon: Icons.lock,
          validator: (String? v) {
            if (v!.isEmpty || v == null) return "Please entre your password";
            return null;
          },
          isPassword: true,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 50,
          width: double.infinity,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: MaterialButton(
              elevation: 0,
              onPressed: () {

              },
              color: Colors.indigo,
              child: Text(
                      "Done",
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: "Schyler",
                        color: Colors.white,
                      ),
                    ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have not any account ??? ',
              style: TextStyle(
                fontSize: 15,
                fontFamily: "Schyler",
                color: Colors.black,
              ),
            ),
            Expanded(
              child: TextButton(
                  onPressed: () {

                  },
                  child: Text("CREATE ONE !!")),
            )
          ],
        )
      ],
    ),
  );
}

forRegister(  ) {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  return Form(
    key: formKey,
    child: Column(children: [
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          "Sign In",
          style: TextStyle(
            fontSize: 30,
            fontFamily: "Schyler",
          ),
        ),
      ),
      textFieild(
        controller: name,
        labelText: "user name",
        hint: "",
        icon: Icons.supervised_user_circle_sharp,
        validator: (v) {
          if (v.isEmpty || v == null) return "Please entre your name";
          return null;
        },
        isPassword: false,
      ),
      SizedBox(
        height: 20,
      ),
      textFieild(
        controller: email,
        labelText: "email",
        hint: "example@example.com",
        icon: Icons.email_outlined,
        validator: (v) {
          if (!v!.contains("@") || !v.contains(".com"))
            return "The email is badly formatted";
          else if (v.isEmpty || v == null) return "Please entre your email";
          return null;
        },
        isPassword: false,
      ),
      SizedBox(
        height: 20,
      ),
      textFieild(
        controller: password,
        labelText: "password",
        hint: "",
        icon: Icons.lock,
        validator: (String? v) {
          if (v!.isEmpty || v == null)
            return "Please entre your password";
          else if (v.length < 8)
            return "your password is very small he must be more then 8 characters";
          return null;
        },
        isPassword: true,
      ),
      SizedBox(
        height: 20,
      ),
      Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: MaterialButton(
            elevation: 0,
            onPressed: () {

            },
            color: Colors.indigo,
            child:  Text(
                    "Done",
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Schyler",
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You have a account ??? ',
            style: TextStyle(
              fontSize: 15,
              fontFamily: "Schyler",
              color: Colors.black,
            ),
          ),
          Expanded(
            child: TextButton(
                onPressed: () {

                },
                child: Text("SIGN IN !!")),
          )
        ],
      ),
    ]),
  );
}

navigate(route, context, isTrue) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx) => route), (route) => isTrue);
}

Widget itemeBuilder(iteme, ctx) => InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        navigate(
            MobileProductScreen(
              model: iteme,
            ),
            ctx,
            true);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[200],
        ),
        margin: EdgeInsets.all(5),
        width: 200,
        child: Column(
          children: [
            Container(
              height: 150,
              child: ClipRRect(
                  child: Image.network(
                    iteme["image"][0],
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "${iteme['title']}",
                    style: TextStyle(fontSize: 40),
                  ),
                  Spacer(),
                  Text(
                    "${iteme["price"]} \$",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            SmoothStarRating(
              isReadOnly: true,
              rating: iteme["rating"].toDouble(),
            )
          ],
        ),
      ),
    );

Widget listBuilder(list, ctx) => list.length != 0
    ? Container(
        height: 250,
        width: 1000,
        child: ListView.builder(
          itemBuilder: (ctx, i) => itemeBuilder(list[i], ctx),
          itemCount: list.length <= 1
              ? list.length
              : list.length % 2 == 0
                  ? (list.length / 2).toInt()
                  : (list.length / 2 - 0.5).toInt(),
          scrollDirection: Axis.horizontal,
        ),
      )
    : Text('There is not any iteme');

Widget buildComment(model) => Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmoothStarRating(
            isReadOnly: true,
            rating: model["rating"].toDouble(),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              CircleAvatar(
                  child: Text("${model["user"]}"),
                radius: 20,
              ),
              SizedBox(
                width: 20,
              ),
       Expanded(child: Text("${model['comment']}"))
            ],
          ),
        ],
      ),
    );

