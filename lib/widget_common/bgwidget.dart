import '/consts/const.dart';

Widget bgWidget({context, Widget? child}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    decoration: const BoxDecoration(
        image: DecorationImage(
      image: AssetImage(
        bg4,
      ),
      fit: BoxFit.fill,
    )),
    child: child,
  );
}
