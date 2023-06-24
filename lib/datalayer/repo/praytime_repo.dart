// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import '../model/praytime_model.dart';
import '../webservice/praytimeservice.dart';

class PrayTimeRepo {
  final PrayTimeService service;
  PrayTimeRepo({
    required this.service,
  });

  Future<PrayTimeModel> getData(
      double lat, double long, int year, int month) async {
    dynamic data = await service.getData(lat, long, year, month);

    return prayTimeFromJson(data.toString());
  }
}
