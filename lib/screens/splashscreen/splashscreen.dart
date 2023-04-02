import 'package:weather_app/screens/homescreen/homescreen.dart';
import 'package:weather_app/widget_common/our_button.dart';

import '../../widget_common/bgwidget.dart';
import '/consts/const.dart';

class HelperScreen extends StatefulWidget {
  const HelperScreen({super.key});

  @override
  State<HelperScreen> createState() => _HelperScreenState();
}

class _HelperScreenState extends State<HelperScreen> {
  // changeScreen() {
  //   Future.delayed(
  //     const Duration(seconds: 5),
  //     () {
  //       Get.to(() => const WeatherApp());
  //     },
  //   );
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   changeScreen();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: bgWidget(
            context: context,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: splashtext.text
                      .color(golden)
                      .size(18)
                      .fontFamily(bold)
                      .make(),
                ),
                10.heightBox,
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(
                      icon,
                    ),
                    fit: BoxFit.contain,
                  )),
                ),
                10.heightBox,
                SpinKitWave(
                  size: 50,
                  color: golden,
                ),
                15.heightBox,
                Container(
                  width: 100,
                  child: ourButton(
                    color: redColor,
                    title: splashbuttontext,
                    textColor: whiteColor,
                    onpress: () {
                      Get.to(() => const WeatherApp());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
