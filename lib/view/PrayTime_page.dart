import 'package:evry_thing/constant/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constant/my_strings.dart';
import '../viewmodel/praytime_viewmodel.dart';

class PrayTimePage extends GetView<PrayTimeViewModel> {
  const PrayTimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white, //MyColors.Primary,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          actions: [
            Align(
              alignment: Alignment.center,
              child: GetBuilder<PrayTimeViewModel>(
                builder: (con) => Text(
                  '${con.placemarks.first.locality}',
                  style: textstyle(color: MyColors.background1, size: 16.sp),
                ),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Image.asset('assets/icons/ball.gif'),
          ],
          backgroundColor: Colors.white.withOpacity(0),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                  height: 200.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        opacity: .9,
                        image: AssetImage(
                          'assets/images/pr.png',
                        ),
                        fit: BoxFit.contain),
                  )),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: MyColors.textGrey,
                      borderRadius: BorderRadius.circular(100)),
                  height: 200,
                  width: double.infinity,
                  child: GetBuilder<PrayTimeViewModel>(
                    builder: (con) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${con.day}',
                          style: textstyle(
                              color: MyColors.background1, size: 16.sp),
                        ),
                        Text(
                          '${con.formattedDate}',
                          style: textstyle(
                              color: MyColors.background1, size: 16.sp),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    //color: MyColors.textGrey,
                    width: double.infinity,
                    child: GetBuilder<PrayTimeViewModel>(
                      builder: (controller) => Column(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.notifications,
                                  color: MyColors.Primary,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  '${controller.praytime!.data[0].timings.fajr}',
                                  style: textstyle(
                                      color: MyColors.background1,
                                      size: 16,
                                      weight: FontWeight.bold),
                                ),
                                Spacer(),
                                Text(
                                  'الفجر',
                                  style: textstyle(
                                      color: MyColors.Primary,
                                      size: 16,
                                      weight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: MyColors.textGrey,
                            endIndent: 3,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.notifications,
                                  color: MyColors.Primary,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                    style: textstyle(
                                        color: MyColors.background1,
                                        size: 16,
                                        weight: FontWeight.bold),
                                    '${controller.praytime!.data[0].timings.dhuhr}'),
                                Spacer(),
                                Text(
                                  'الظهر',
                                  style: textstyle(
                                      color: MyColors.Primary,
                                      size: 16,
                                      weight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: MyColors.textGrey,
                            endIndent: 3,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.notifications,
                                  color: MyColors.Primary,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                    style: textstyle(
                                        color: MyColors.background1,
                                        size: 16,
                                        weight: FontWeight.bold),
                                    '${controller.praytime!.data[0].timings.asr}'),
                                Spacer(),
                                Text(
                                  'العصر',
                                  style: textstyle(
                                      color: MyColors.Primary,
                                      size: 16,
                                      weight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: MyColors.textGrey,
                            endIndent: 3,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.notifications,
                                  color: MyColors.Primary,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                    style: textstyle(
                                        color: MyColors.background1,
                                        size: 16,
                                        weight: FontWeight.bold),
                                    '${controller.praytime!.data[0].timings.maghrib}'),
                                Spacer(),
                                Text(
                                  'المغرب',
                                  style: textstyle(
                                      color: MyColors.Primary,
                                      size: 16,
                                      weight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: MyColors.textGrey,
                            endIndent: 3,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.notifications,
                                  color: MyColors.Primary,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                    style: textstyle(
                                        color: MyColors.background1,
                                        size: 16,
                                        weight: FontWeight.bold),
                                    '${controller.praytime!.data[0].timings.isha}'),
                                Spacer(),
                                Text(
                                  'العشاء',
                                  style: textstyle(
                                      color: MyColors.Primary,
                                      size: 16,
                                      weight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
