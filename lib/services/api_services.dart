// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:weather_app/consts/const.dart';
// import 'package:weather_app/models/city_weather_model.dart';
// import 'package:weather_app/models/current_weather_model.dart';
// import 'package:weather_app/models/hourly_weather_model.dart';

// // var link =
// //     "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric";
// // var hourlyLink =
// // "https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric";

// class DataService {
//   static getCurrentWeather(lat, lon) async {
//     var link =
//         "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric";
//     var res = await http.get(Uri.parse(link));
//     if (res.statusCode == 200) {
//       var data = currentWeatherDataFromJson(res.body.toString());
//       return data;
//     }
//   }

//   getCurrentHourlyWeather(lat, lon) async {
//     var link =
//         "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$apiKey&units=metric";
//     var res = await http.get(Uri.parse(link));
//     if (res.statusCode == 200) {
//       var data = hourlyWeatherDataFromJson(res.body.toString());

//       return data;
//     }
//   }
// }
