import 'package:desktop_window/desktop_window.dart';
import 'package:ecommerce_app/Screens/Home/MobileHomeScreen.dart';
import 'package:ecommerce_app/Screens/Login_and_Registre%20/DesktopLoginScreen.dart';
import 'package:ecommerce_app/Screens/Login_and_Registre%20/MobileLoginScreen.dart';
import 'package:ecommerce_app/shared/Cubit/Cubit.dat.dart';
import 'package:ecommerce_app/shared/Cubit/observer.dart';
import 'package:ecommerce_app/shared/sharedPrf/helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  try {
    await DesktopWindow.setMinWindowSize(Size.fromWidth(382));
  } catch (e) {
    print('error');
  }
  Bloc.observer = MyBlocObserver();
  await SharedPrefHelper.init();
  await MyCubit().getData();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  Widget startScreen = SharedPrefHelper.getData(
            "isIn",
          ) ==
          null
      ? MobileLoginScreen()
      : HomeScreen();

  @override
  Widget build(BuildContext context) {
    MyCubit c = Get.put(MyCubit());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Obx( () {
          return LayoutBuilder(
            builder: (ctx, size) {
              print(size.maxHeight);
              print(size.maxWidth);
              if (size.maxWidth > 588) return DesktopLoginScreen();
              return startScreen;
            },
          );
        }
      ),
    );
  }
}
