// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import '../model/azkar_model.dart';
import '../model/praytime_model.dart';
import '../webservice/azkarservice.dart';

class AzkarRepo {
  final AzkarService service;
  AzkarRepo({
    required this.service,
  });

  Future<AzkarModel> getData(String type) async {
    dynamic data = await service.getData(type);

    return azkarFromJson(data.toString());
  }
}
