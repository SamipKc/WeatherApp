import 'package:geolocator/geolocator.dart';
import 'package:weather_app/consts/const.dart';

import 'package:weather_app/models/current_weather_model.dart';

import '../services/data_service.dart';

class MainController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await getUserLocation();
    currentWeatherData =
        DataService.getCurrentWeather(latitude.value, longitude.value);
    hourlyWeatherData =
        DataService.getCurrentHourlyWeather(latitude.value, longitude.value);
  }

// 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
  var isDark = false.obs;
  Future<CurrentWeatherData>? currentWeatherData;
  dynamic hourlyWeatherData;
  dynamic cityWeatherData;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;

  changeTheme() {
    isDark.value = !isDark.value;
    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
  }

  getUserLocation() async {
    dynamic isLocationEnabled;
    dynamic userPermission;
    isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationEnabled) {
      return Future.error("Location is not enabled");
    }
    userPermission = await Geolocator.checkPermission();
    if (userPermission == LocationPermission.deniedForever) {
      return Future.error("Permission is denied forever");
    } else if (userPermission == LocationPermission.denied) {
      userPermission = await Geolocator.requestPermission();
      if (userPermission == LocationPermission.denied) {
        return Future.error("Permission is denied");
      }
    }
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).then((value) {
      latitude.value = value.latitude;
      longitude.value = value.longitude;
    });
  }
}
