import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../datalayer/model/suras_model.dart';

class SuraTabViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  Future<List<SuraModel>> getdata() async {
    String data = await rootBundle.loadString('assets/datas/suras.json');
    print('========0');
    return suraFromJson(data);
  }
}
