// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evry_thing/datalayer/webservice/praytimeservice.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../datalayer/model/praytime_model.dart';
import '../datalayer/repo/praytime_repo.dart';
import 'package:geocoding/geocoding.dart';

class PrayTimeViewModel extends GetxController {
  late final PrayTimeModel? _PrayTimeModel;
  PrayTimeModel? get praytime => _PrayTimeModel;
  late double lat;
  late double long;
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  late List<Placemark> placemarks;

  RxString day = ''.obs;
  RxString formattedDate = ''.obs;

  PrayTimeRepo prayrepo = PrayTimeRepo(service: PrayTimeService());

  @override
  void onInit() async {
    super.onInit();
    await date();
    await _determinePosition();
    getdata();
  }

  date() async {
    await initializeDateFormatting('ar');
    day = DateFormat('EEEE', 'ar').format(DateTime.now()).obs;
    formattedDate = DateFormat.yMMMMd('ar').format(DateTime.now()).obs;
    update();
  }

  Future _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition();

    lat = position.latitude;
    long = position.longitude;
    print(lat);
    print(long);

    placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks.first.locality);
    update();
  }

  getdata() async {
    _PrayTimeModel = await prayrepo.getData(lat, long, year, month);
    print(_PrayTimeModel!.data[0].timings.fajr);
    update();
  }
}
