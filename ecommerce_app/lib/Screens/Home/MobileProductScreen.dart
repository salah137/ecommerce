import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/shared/Components/components.dart';
import 'package:ecommerce_app/shared/Cubit/Cubit.dat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class MobileProductScreen extends StatefulWidget {
  const MobileProductScreen({Key? key, this.model}) : super(key: key);
  final model;
  @override
  _MobileProductScreenState createState() => _MobileProductScreenState(model);
}

class _MobileProductScreenState extends State<MobileProductScreen> {
  var height = false;
  final model;
  GlobalKey<ScaffoldState> skey = GlobalKey<ScaffoldState>();
  TextEditingController commentController = TextEditingController();
  _MobileProductScreenState(this.model);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          key: skey,
          backgroundColor: Colors.white,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: Container(),
                backgroundColor: Colors.white,
                flexibleSpace: Container(
                  child: CarouselSlider(
                    items: [
                      ...model["image"].map(
                        (image) => ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            image: NetworkImage(image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                    options: CarouselOptions(
                      height: 230.0,
                    ),
                  ),
                ),
                expandedHeight: 230,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                "${model["title"]}",
                                style: TextStyle(
                                  fontSize: 40,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${model["price"]}",
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          color: Colors.grey[100],
                          padding: EdgeInsets.all(15),
                          child: Text(
                            "${model["description"]}",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      height: 40,
                      margin: EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: MaterialButton(
                          color: Colors.indigo,
                          onPressed: () {},
                          child: Text(
                            "Add To Cart",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: SmoothStarRating(
                        rating: 3.0,
                        isReadOnly: true,
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      padding: EdgeInsets.all(5),
                      height: height ? 400 : 0,
                      color: Colors.grey[200],
                      child: SingleChildScrollView(
                        child:

                             Column(
                                children: [
                                  ...model['comments']
                                      .map((model) => buildComment(model)),
                                  Container(
                                    height: 40,
                                    width: double.infinity,
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.indigo),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: MaterialButton(
                                        onPressed: () {
                                          skey.currentState!.showBottomSheet(
                                            (context) {
                                              double rating = 0;
                                              return Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SmoothStarRating(
                                                    rating: rating,
                                                    onRated: (v) {
                                                      rating = v;
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  textFieild(
                                                      controller:
                                                          commentController,
                                                      labelText:
                                                          "entre a comment",
                                                      hint: "",
                                                      icon: Icons.comment,
                                                      validator: (v) {},
                                                      isPassword: false),
                                                  Container(
                                                    height: 40,
                                                    width: double.infinity,
                                                    margin: EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Colors.indigo),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: MaterialButton(
                                                        onPressed: () {
                                                        },
                                                        child: Text(
                                                          "Submite",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: Text(
                                          "Add A Comment",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.indigo),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              height = !height;
                            });
                          },
                          child: Text(
                            height ? "demiss" : "show comments",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    listBuilder(
                        MyCubit.products
                            .where(
                                (element) => element["type"] == model["type"])
                            .toList(),
                        context)
                  ],
                ),
              )
            ],
          ),
        );

  }
}
