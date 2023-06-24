import 'package:get/get.dart';

import '../datalayer/model/azkar_model.dart';
import '../datalayer/repo/azkar_repo.dart';
import '../datalayer/webservice/azkarservice.dart';

class AzkarViewModel extends GetxController {
  late AzkarModel _azkarModel;
  late List<int> counters;

  int _repeat = 0;
  get repeat => _repeat;
  AzkarModel get azkarmodel => _azkarModel;
  AzkarRepo azkarrepo = AzkarRepo(service: AzkarService());

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }

  getdata(String type) async {
    _azkarModel = await azkarrepo.getData(type);
    counters = List.generate(_azkarModel.content.length, (index) => 0);

    update();
  }

  addrepeat(int index) {
    counters[index]++;
    update();
  }
}
