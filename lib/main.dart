import 'package:client_app/View/OnBoardingScreen.dart';
import 'package:client_app/View/RestaurantScreen.dart';
import 'package:client_app/View/RestaurantsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Themes/Theme.dart';


void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(context) {
    return ScreenUtilInit(
      designSize: const Size(428 , 926),
      builder: ( context, Widget? child) { return  GetMaterialApp(
          theme: theme(),
          home: OnBoardingScreen()
       );},
    );
  }
}
