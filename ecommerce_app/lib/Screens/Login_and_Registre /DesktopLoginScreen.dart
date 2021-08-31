import 'package:ecommerce_app/shared/Components/components.dart';
import 'package:ecommerce_app/shared/Cubit/Cubit.dat.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

class DesktopLoginScreen extends StatelessWidget {
  const DesktopLoginScreen({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {

           return Scaffold(
        body: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.indigo,
              ),
            ),
            Expanded(
              child: Column(
                children: [forLogin(),]
              ),
            ),
          ],
        ),
      );

  }

}
