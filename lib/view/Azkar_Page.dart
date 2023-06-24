import 'package:evry_thing/viewmodel/azkar_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constant/my_colors.dart';
import '../constant/my_strings.dart';
import 'azkardata_page.dart';

class AzkarPage extends GetView<AzkarViewModel> {
  const AzkarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.background1,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          title: Text('الأذكار',
              style: textstyle(
                  color: MyColors.textWhite,
                  size: 20.sp,
                  weight: FontWeight.bold)),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            azkarshape('اذكار الصباح'),
            SizedBox(
              height: 10.h,
            ),
            azkarshape('ذكار المساء'),
            SizedBox(
              height: 10.h,
            ),
            azkarshape('اذكار الصلاه')
          ],
        ));
  }

  Widget azkarshape(String name) => GetBuilder<AzkarViewModel>(
        init: AzkarViewModel(),
        builder: (controller) => Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: () async {
              switch (name) {
                case 'اذكار الصباح':
                  await controller.getdata(apisubah);
                  Get.to(() => AzkarDataPage(
                        name: name,
                      ));
                  break;
                case 'ذكار المساء':
                  await controller.getdata(apimasa);
                  Get.to(() => AzkarDataPage(
                        name: name,
                      ));
                  break;
                case 'اذكار الصلاه':
                  await controller.getdata(apipray);
                  Get.to(() => AzkarDataPage(
                        name: name,
                      ));
                  break;
                default:
                  print('error');
              }
            },
            child: Container(
              width: 200.w,
              height: 200.h,
              decoration: BoxDecoration(
                  color: Colors.blueGrey.shade600,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1,
                    )
                  ],
                  gradient: LinearGradient(colors: [
                    MyColors.shapegrade1,
                    MyColors.shapegrade2,
                    MyColors.shapegrade3
                  ])),
              child: Column(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        '$name',
                        style: textstyle(
                            color: MyColors.textWhite,
                            size: 20,
                            weight: FontWeight.bold),
                      )),
                ],
              ),
            ),
          ),
        ),
      );
}
