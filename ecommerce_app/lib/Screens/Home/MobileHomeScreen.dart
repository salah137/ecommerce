import 'package:ecommerce_app/shared/Components/components.dart';
import 'package:ecommerce_app/shared/Cubit/Cubit.dat.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: Stack(
              alignment: Alignment.bottomRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg")),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(5)),
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Check Our offers',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: textStyle,
                        fontSize: 30),
                  ),
                ),
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Row(
                  children: [
                    Container(
                      child: Text(
                        'Tech ',
                        style: TextStyle(fontSize: 30, fontFamily: textStyle),
                      ),
                      margin: EdgeInsets.all(10),
                    ),
                    Spacer(),
                    TextButton(onPressed: () {}, child: Text("SHOW ALL")),
                  ],
                ),
                listBuilder(
                  MyCubit.products
                      .where((element) => element["type"] == "tech").toList(),
                  context,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

String textStyle = "Schyler";
