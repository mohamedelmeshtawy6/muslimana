import 'package:dio/dio.dart';

class AzkarService {
  Dio dio = Dio();

  Future<dynamic> getData(String type) async {
    dynamic data =
        await dio.get('https://ahegazy.github.io/muslimKit/json/$type.json');

    return data;
  }
}
