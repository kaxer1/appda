import 'package:flutter/material.dart';

Color? textFieldBackground = Colors.grey[200];
Color secondaryColor = const Color(0xff39c526);
Color blackColor = Colors.black;
Color redColor = Colors.red;

Color btnColorPrimary = const Color(0xffF7A801);
Color btnColorPrimaryDisable = const Color(0xffF7A801);
Color btnColorSecundario = const Color(0xffB0BEC5);

Color primaryColor = const Color(0xffF7A801);

BoxDecoration boxDecoration = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.2, 0.8],
        colors: [
          Color(0xff2E305F),
          Color(0xff202333)
        ]
      )
  );