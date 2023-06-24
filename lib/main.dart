import 'package:evry_thing/helper/my_binding.dart';
import 'package:evry_thing/view/control_page.dart';
import 'package:evry_thing/view/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return ScreenUtilInit(
        designSize: const Size(374, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialBinding: MyBinding(),
            home: const SplashPage(),
          );
        });
  }
}
