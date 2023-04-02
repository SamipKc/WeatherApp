import 'package:weather_app/our_themes.dart';
import 'package:weather_app/screens/homescreen/homescreen.dart';
import 'package:weather_app/screens/splashscreen/splashscreen.dart';

import 'consts/const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: CustomThemes.lightTheme,
      darkTheme: CustomThemes.darkTheme,
      themeMode: ThemeMode.system,
      title: "Weather App",
      debugShowCheckedModeBanner: false,
      home: HelperScreen(),
    );
  }
}
