import '/consts/const.dart';

Widget customTextField({hint, controller, onpress}) {
  return Column(
    children: [
      10.heightBox,
      TextField(
        controller: controller,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.location_city,
            color: darkfontGrey,
          ),
          suffixIcon: IconButton(
            onPressed: onpress,
            icon: Icon(
              Icons.clear,
              color: redColor,
            ),
          ),
          labelText: hintLocation,
          labelStyle: TextStyle(
            fontSize: 20,
            color: darkfontGrey,
          ),

          focusColor: Colors.blueAccent,
          // floatingLabelStyle: TextStyle(
          //   color: Colors.blue,
          //   fontSize: 20,
          // ),
          // isDense: false,
          isDense: true,
          filled: true,
          fillColor: lightGrey,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white, width: 1),
          ),

          // focusedBorder: const OutlineInputBorder(
          //   borderSide: BorderSide(
          //     color: darkfontGrey,
          //   ),
          // ),
        ),
      ),
      10.heightBox,
    ],
  );
}
