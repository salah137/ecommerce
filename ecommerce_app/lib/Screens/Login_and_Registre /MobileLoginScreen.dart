import 'package:ecommerce_app/shared/Components/components.dart';
import 'package:ecommerce_app/shared/Cubit/Cubit.dat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 250,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              floating: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [forLogin(),]
              ),
            )
          ],
        ),
      );

  }
}
/*
* */

/*
* Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            floating: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              forLogin(context,"mobile"),
            ),
          )
        ],
      ),
    );*/