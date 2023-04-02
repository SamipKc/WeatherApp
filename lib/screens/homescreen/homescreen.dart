import 'package:weather_app/models/city_weather_model.dart';
import 'package:weather_app/screens/homescreen/header.dart';
import 'package:weather_app/services/data_service.dart';
import 'package:weather_app/widget_common/custom_textfield.dart';
import 'package:weather_app/widget_common/our_button.dart';
import '/consts/const.dart';
import 'package:weather_app/controllers/main_controller.dart';
import 'package:weather_app/models/current_weather_model.dart';
import 'package:weather_app/models/hourly_weather_model.dart';
import 'package:weather_app/services/api_services.dart';
import 'package:intl/intl.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final _cityTextController = TextEditingController();
  CurrentWeatherData? _response;
  // final MainController mainController =
  //     Get.put(MainController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    var date = DateFormat("yMMMd").format(DateTime.now());
    var theme = Theme.of(context);

    var controller = Get.put(MainController());

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: date.text.color(theme.primaryColor).make(),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 12, 175, 75),
                  Color.fromARGB(255, 183, 128, 255),
                ],
              ),
            ),
          ),
          actions: [
            Obx(
              () => IconButton(
                onPressed: () {
                  controller.changeTheme();
                },
                icon: Icon(
                  controller.isDark.value ? Icons.light_mode : Icons.dark_mode,
                  color: theme.iconTheme.color,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: theme.iconTheme.color,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 91, 175, 12),
                  Color.fromARGB(255, 255, 168, 128),
                ],
              ),
            ),
            child: Column(
              children: [
                customTextField(
                    onpress: _cityTextController.clear,
                    controller: _cityTextController),
                Header(
                  controller: _cityTextController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
