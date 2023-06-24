import 'package:evry_thing/viewmodel/control_viewmodel.dart';
import 'package:get/get.dart';

import '../viewmodel/azkar_viewmodel.dart';
import '../viewmodel/praytime_viewmodel.dart';
import '../viewmodel/sura_tab_viewmodel.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => SuraTabViewModel());
    Get.lazyPut(() => AzkarViewModel());
    Get.put(PrayTimeViewModel());
  }
}
