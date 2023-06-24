import 'package:evry_thing/view/Azkar_Page.dart';
import 'package:evry_thing/view/PrayTime_page.dart';
import 'package:evry_thing/view/Quran_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/Qiblah_Page.dart';

class ControlViewModel extends GetxController {
  Widget _currentScreen = const QuranPage();

  Widget get currentScreen => _currentScreen;

  void changeSelectedValue(int selectedValue) {
    switch (selectedValue) {
      case 0:
        _currentScreen = const QuranPage();
        break;

      case 1:
        _currentScreen = const PrayTimePage();
        break;
      case 2:
        _currentScreen = QiblahPage();
        break;

      case 3:
        _currentScreen = const AzkarPage();
        break;
    }
    update();
  }
}
