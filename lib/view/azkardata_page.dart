// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evry_thing/constant/my_colors.dart';
import 'package:evry_thing/viewmodel/azkar_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AzkarDataPage extends GetView<AzkarViewModel> {
  String name;
  AzkarDataPage({
    Key? key,
    required this.name,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background1,
      appBar: AppBar(
        centerTitle: true,
        title: Text(name),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: controller.azkarmodel.content.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 8.0,
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(16.0),
                      child: Text(controller.azkarmodel.content[index].zekr,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold))),
                  Container(
                      padding: EdgeInsets.all(16.0),
                      child: Text(controller.azkarmodel.content[index].bless,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.green,
                              fontWeight: FontWeight.w400))),
                  GestureDetector(
                    onTap: () {
                      controller.addrepeat(index);
                    },
                    child: CircleAvatar(
                      backgroundColor: MyColors.background1,
                      radius: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              '${controller.azkarmodel.content[index].repeat}/ '),
                          GetBuilder<AzkarViewModel>(
                            builder: (control) =>
                                Text(' ${control.counters[index]}'),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
