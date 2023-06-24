import 'package:evry_thing/constant/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../viewmodel/control_viewmodel.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class ControlPage extends GetView<ControlViewModel> {
  const ControlPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControlViewModel>(
      builder: (controller) => Scaffold(
        body: controller.currentScreen,
        bottomNavigationBar: bottomNavigationBar(),
      ),
    );
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
        builder: (controller) => ConvexAppBar(
              height: 58.h,
              backgroundColor: MyColors.background2,
              color: Colors.white,
              onTap: (index) {
                controller.changeSelectedValue(index);
              },
              items: [
                TabItem(
                    icon: Image.asset('assets/icons/qurann.png'),
                    title: 'قراءن'),
                TabItem(
                    icon: SvgPicture.asset(
                      'assets/svg/pray.svg',
                    ),
                    title: 'توقيت الصلاة'),
                TabItem(
                    icon: SvgPicture.asset(
                      'assets/svg/compass.svg',
                    ),
                    title: 'تحديد القبله'),
                TabItem(
                    icon: Image.asset('assets/icons/beads.png'),
                    title: 'اذكار'),
              ],
            ));
  }
}
