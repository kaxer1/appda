import 'package:flutter/material.dart';
import 'package:appda/theme/style.dart';

// Clase que devuelve un InputDecoration para manejar el estilo de los inputs
class InputDecorations {

  static InputDecoration inputDecorationPersonalizado({
    required String hintText,
    required String labelText,
    double? labelFontSize,
    IconData? prefixIcon,
    IconData? suffixIcon,
    Function? onTap
  }) {
    return InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: colorInputDecorations
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: colorInputDecorations,
            width: 2
          )
        ),
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.grey,
          fontSize: labelFontSize
        ),
        prefixIcon: prefixIcon != null 
          ? GestureDetector(onTap: onTap as void Function()?, child: Icon( prefixIcon, color: colorInputDecorations ))
          : null,
        suffixIcon : suffixIcon != null 
          ? GestureDetector(onTap: onTap as void Function()?, child: Icon( suffixIcon, color: colorInputDecorations ))
          : null
      );
  }  

}