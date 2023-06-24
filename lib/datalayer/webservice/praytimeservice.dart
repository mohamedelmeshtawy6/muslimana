import 'package:dio/dio.dart';

class PrayTimeService {
  Dio dio = Dio();

  Future<dynamic> getData(double lat, double long, int year, int month) async {
    dynamic data = await dio.get(
        'https://api.aladhan.com/v1/calendar/$year/$month?latitude=$lat&longitude=$long');

    return data;
  }
}
