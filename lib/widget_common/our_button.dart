import '/consts/const.dart';

Widget ourButton({onpress, String? title, color, textColor}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: const EdgeInsets.all(12),
    ),
    onPressed: onpress,
    child: title!.text.color(textColor).size(18).fontFamily(bold).make(),
  );
}
