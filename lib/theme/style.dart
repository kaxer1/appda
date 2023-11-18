import 'package:flutter/material.dart';

final BorderRadius radius = BorderRadius.circular(6.0);
const Color primaryColor = Color(0xffF7A801);

final ThemeData appTheme = ThemeData(
  fontFamily: 'ProductSans',
  scaffoldBackgroundColor: Colors.white,
  backgroundColor: const Color(0xfff3f5f5),
  primaryColor: primaryColor,
  hintColor: Colors.grey[400],
  // splashcolor
  splashColor: const Color(0xff000000),

  ///appBar theme
  appBarTheme: const AppBarTheme(
    color: Color.fromRGBO(55, 57, 84, 1),
    elevation: 0.0,
  ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color.fromRGBO(55, 57, 84, 1),
    unselectedItemColor: Color.fromRGBO(116, 117, 152, 1),
  ),

  ///text theme
  textTheme: TextTheme(
    bodyText1: const TextStyle(),
    bodyText2: const TextStyle(fontWeight: FontWeight.w400),
    subtitle1: const TextStyle(fontWeight: FontWeight.w500),
    subtitle2: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.w400),
    headline1: const TextStyle(),
    headline2: const TextStyle(),
    headline3: const TextStyle(),
    headline4: const TextStyle(),
    headline5: const TextStyle(),
    headline6: const TextStyle(),
  ).apply(bodyColor: Colors.black),
);

const TextStyle bottomBarTextStyle = TextStyle(
  fontSize: 15.0,
  color: Colors.white,
  fontWeight: FontWeight.w400,
);

// Temas propios
const Color unoLinearGradient = Color(0xff039BE5);
const Color dosLinearGradient = Color(0xff01579B);
const Color colorInputDecorations = Color(0xff0277BD);

const Color colorSnackbarError = Color(0xffFF5252);

const Color colorCardTraslucido = Color.fromARGB(181, 227, 225, 225);