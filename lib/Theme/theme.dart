import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor mainColor = MaterialColor(
    0xff06d6a0,
    //2882FC
    <int, Color>{
      50: Color(0xff2475e3), //10%
      100: Color(0xff2068ca), //20%
      200: Color(0xff1c5bb0), //30%
      300: Color(0xff184e97), //40%
      400: Color(0xff14417e), //50%
      500: Color(0xff103465), //60%
      600: Color(0xff0c274c), //70%
      700: Color(0xff081a32), //80%
      800: Color(0xff040d19), //90%
      900: Color(0xff000000), //100%
    },
  );
}

Color secondaryColor = const Color.fromRGBO(7, 59, 76, 1);
// 0, 44, 66
