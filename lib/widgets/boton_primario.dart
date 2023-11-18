import 'package:flutter/material.dart';
import 'package:appda/theme/colors.dart';
import 'package:get/get.dart';

// Boton primario personalizado a ser reutilizado en el sistema
class BotonPrimario extends StatelessWidget {

  final double? height;
  final double? width;
  final String? label;
  final Function? onPressed;
  final Color? textColor;
  final double? radius;
  final double? mt;
  final double? mb; 
  final double? ml;
  final double? mr; 
  final Color? color;
  final TextStyle? textStyle;
  final double? px;
  final double? py;
  final Widget? icon;

  const BotonPrimario({
    Key? key, 
    required this.label,
    this.onPressed,
    this.radius,
    this.height,
    this.width,
    this.color,
    this.mt, 
    this.mb,
    this.ml, 
    this.mr,
    this.textStyle,
    this.textColor,
    this.px,
    this.py,
    this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: mt ?? 0,
        bottom: mb ?? 0,
        left: ml ?? 0,
        right: mr ?? 0
      ),
      child: icon != null
        ?  ElevatedButton.icon(
            icon: icon ?? const Icon( Icons.abc ),
            onPressed: onPressed as void Function()?,
            style: _estiloBoton(),
            label: _contenidoBoton()
          )
        :  ElevatedButton(
            onPressed: onPressed as void Function()?,
            style: _estiloBoton(),
            child: _contenidoBoton()
          ),
    );
  }

  ButtonStyle _estiloBoton () {
    return ElevatedButton.styleFrom(
      primary: color ?? btnColorPrimary,
      onSurface: btnColorPrimaryDisable,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 10.0),
      ),
      padding: EdgeInsets.symmetric( 
        horizontal: px ?? 10, 
        vertical: py ?? 15
      ),
    );
  }

  SizedBox _contenidoBoton () {
    return SizedBox(
      height: height,
      width: width ?? double.infinity,
      child: Text(
        label ?? 'bntContinuar'.tr,
        textAlign: TextAlign.center,
        style: textStyle ??
            Get.textTheme.subtitle1!.copyWith(
                color: textColor ?? Get.theme.scaffoldBackgroundColor),
      ),
    );
  }
}
