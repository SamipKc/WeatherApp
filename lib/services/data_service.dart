import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/city_weather_model.dart';

import '../consts/strings.dart';
import '../models/current_weather_model.dart';
import '../models/hourly_weather_model.dart';

class DataService {
  static Future<CurrentWeatherData> getWeatherData(String city) async {
    //https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    final queryParameters = {
      'q': city,
      'appid': 'bcad311ecf59ff8e8f34b91feefa2b0d',
      'units': 'metric'
    };
    final uri = Uri.http(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    // print(response.body);
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return CurrentWeatherData.fromJson(json);
  }

  static Future<CurrentWeatherData> getCurrentWeather(lat, lon) async {
    var link =
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric";
    var res = await http.get(Uri.parse(link));
    // if (res.statusCode == 200) {
    var data = currentWeatherDataFromJson(res.body.toString());
    return data;
    // }
  }

  static getCurrentHourlyWeather(lat, lon) async {
    var link =
        "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$apiKey&units=metric";
    var res = await http.get(Uri.parse(link));
    if (res.statusCode == 200) {
      var data = hourlyWeatherDataFromJson(res.body.toString());

      return data;
    }
  }
}
