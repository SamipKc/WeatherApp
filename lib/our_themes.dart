import 'package:weather_app/consts/const.dart';

class CustomThemes {
  static final lightTheme = ThemeData(
    cardColor: Colors.white,
    fontFamily: "sans_regular",
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Vx.gray800,
    iconTheme: IconThemeData(
      color: Vx.gray600,
    ),
  );
  static final darkTheme = ThemeData(
    cardColor: bgcolor.withOpacity(0.6),
    fontFamily: "sans_regular",
    scaffoldBackgroundColor: bgcolor,
    primaryColor: Colors.white,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  );
}
