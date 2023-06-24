import 'dart:async';

import 'package:evry_thing/constant/my_colors.dart';
import 'package:evry_thing/view/control_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 7), () => Get.off(() => const ControlPage()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: MyColors.background1,
            image: DecorationImage(
              opacity: .2,
              image: AssetImage('assets/images/lamp.png'),
              fit: BoxFit.contain,
            )),
        child: Stack(children: [
          Positioned(
              left: 70.w,
              right: 70.w,
              bottom: 400.h,
              child: Image.asset(
                fit: BoxFit.fill,
                'assets/images/logo.png',
              )),
          Positioned(
              bottom: 100.h,
              left: 10.h,
              right: 10.h,
              child: Container(
                alignment: Alignment.center,
                child: Text('دنـــيـــانـا فـي ديـــنــنـا',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28.sp)),
              )),
        ]),
      ),
    );
  }
}
