import '../../controllers/main_controller.dart';
import '../../models/city_weather_model.dart';
import '../../models/current_weather_model.dart';
import '../../models/hourly_weather_model.dart';
import '../../services/data_service.dart';
import '../../widget_common/custom_textfield.dart';
import '../../widget_common/our_button.dart';
import '/consts/const.dart';
import 'package:intl/intl.dart';

class Header extends StatefulWidget {
  const Header({super.key, required this.controller});
  final TextEditingController controller;
  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  // final MainController mainController =
  //     Get.put(MainController(), permanent: true);

  CurrentWeatherData? _response;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    var controller = Get.put(MainController());
    return Container(
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
      padding: const EdgeInsets.all(12.0),
      child: FutureBuilder<CurrentWeatherData>(
        future: _response == null || widget.controller.text == ""
            ? controller.currentWeatherData
            : _search(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            CurrentWeatherData data = snapshot.data;
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 100,
                        child: ourButton(
                          title: save,
                          color: Colors.deepPurple.shade200,
                          onpress: _search,
                        ),
                      ),
                      20.widthBox,
                      SizedBox(
                        width: 100,
                        child: ourButton(
                          title: update,
                          color: Colors.deepPurple.shade200,
                          onpress: _search,
                        ),
                      ),
                    ],
                  ),
                  10.heightBox,
                  "${data.name}"
                      .text
                      .uppercase
                      .fontFamily(bold)
                      .size(32)
                      .letterSpacing(3)
                      .color(theme.primaryColor)
                      .make(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/images/weather/${data.weather![0].icon}.png",
                        height: 80,
                        width: 80,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "${data.main!.temp} $degree",
                              style: TextStyle(
                                color: theme.primaryColor,
                                fontFamily: semibold,
                                fontSize: 54,
                              ),
                            ),
                            TextSpan(
                              text: "${data.weather![0].main}",
                              style: TextStyle(
                                color: theme.primaryColor,
                                fontFamily: regular,
                                letterSpacing: 3,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton.icon(
                        onPressed: null,
                        icon: Icon(
                          Icons.expand_less_rounded,
                          color: theme.iconTheme.color,
                        ),
                        label: "${data.main!.tempMax} $degree"
                            .text
                            .color(theme.primaryColor)
                            .make(),
                      ),
                      TextButton.icon(
                        onPressed: null,
                        icon: Icon(
                          Icons.expand_more_rounded,
                          color: theme.iconTheme.color,
                        ),
                        label: "${data.main!.tempMin}$degree"
                            .text
                            .color(theme.primaryColor)
                            .make(),
                      )
                    ],
                  ),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(3, (index) {
                      var iconsList = [
                        clouds,
                        humidity,
                        windspeed,
                      ];
                      var values = [
                        "${data.clouds!.all} %",
                        "${data.main!.humidity}%",
                        "${data.wind!.speed} Km/h",
                      ];
                      return Column(
                        children: [
                          Image.asset(
                            iconsList[index],
                            width: 60,
                            height: 60,
                          )
                              .box
                              .gray200
                              .padding(
                                const EdgeInsets.all(8),
                              )
                              .roundedSM
                              .make(),
                          10.heightBox,
                          values[index]
                              .text
                              .color(theme.primaryColor)
                              .size(18)
                              .make(),
                        ],
                      );
                    }),
                  ),
                  10.heightBox,
                  const Divider(),
                  10.heightBox,
                  FutureBuilder(
                    future: controller.hourlyWeatherData,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        HourlyWeatherData hourlyData = snapshot.data;
                        return SizedBox(
                          height: 150,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: hourlyData.list!.length > 6
                                ? 6
                                : hourlyData.list!.length,
                            itemBuilder: (context, index) {
                              var time = DateFormat.jm().format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                      hourlyData.list![index].dt!.toInt() *
                                          1000));
                              return Container(
                                padding: const EdgeInsets.all(8),
                                margin: const EdgeInsets.only(right: 4),
                                decoration: BoxDecoration(
                                  color: Vx.gray200,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  children: [
                                    time.text.make(),
                                    Image.asset(
                                      "assets/images/weather/${hourlyData.list![0].weather![0].icon}.png",
                                      width: 80,
                                    ),
                                    "${hourlyData.list![index].main!.temp}$degree"
                                        .text
                                        .make(),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                  10.heightBox,
                  const Divider(),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "Next 7 Days"
                          .text
                          .semiBold
                          .size(16)
                          .color(theme.primaryColor)
                          .make(),
                      TextButton(
                        onPressed: () {},
                        child: "View All".text.make(),
                      )
                    ],
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      var day = DateFormat("EEEE").format(
                        DateTime.now().add(Duration(
                          days: index + 1,
                        )),
                      );
                      return Card(
                        color: theme.cardColor,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 12,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: day.text
                                    .color(theme.primaryColor)
                                    .semiBold
                                    .make(),
                              ),
                              Expanded(
                                child: TextButton.icon(
                                  onPressed: null,
                                  icon: Image.asset(
                                    "assets/images/weather/50n.png",
                                    width: 40,
                                  ),
                                  label: "26$degree"
                                      .text
                                      .color(theme.primaryColor)
                                      .make(),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "37$degree/",
                                      style: TextStyle(
                                        color: theme.primaryColor,
                                        fontFamily: regular,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " 26$degree",
                                      style: TextStyle(
                                        fontFamily: regular,
                                        color: theme.iconTheme.color,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<CurrentWeatherData> _search() async {
    final response = await DataService.getWeatherData(widget.controller.text);
    setState(
      () {
        _response = response;
      },
    );

    return response;
  }
}
