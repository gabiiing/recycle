import 'package:flutter/material.dart';

Color primary = const Color(0xff687daf);

class Styles {
  static Color primaryColor = primary;
  static Color textColor = const Color(0xff3b3b3b);
  static Color bgColor = const Color(0xffeeeedf2);
  static Color orangeColor = const Color(0xFF526799);
  static TextStyle textStyle = TextStyle(
    fontSize: 16,
    color: textColor,
    fontWeight: FontWeight.w500
  );

  static TextStyle h1 = TextStyle(
    fontSize: 26,
    color: textColor,
    fontWeight: FontWeight.bold
  );

  static TextStyle h2 = TextStyle(
    fontSize: 21,
    color: textColor,
    fontWeight: FontWeight.bold
  );
   static TextStyle h3 = TextStyle(
    fontSize: 17,
    color: Colors.grey.shade500,
    fontWeight: FontWeight.w500
  );
     static TextStyle h3Green = TextStyle(
    fontSize: 17,
    color: Colors.green,
    fontWeight: FontWeight.w500
  );

   static TextStyle h4 = TextStyle(
    fontSize: 14,
    color: Colors.grey.shade500,
    fontWeight: FontWeight.w500
  );
  
}
