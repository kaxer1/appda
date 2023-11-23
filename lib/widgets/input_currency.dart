import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:appda/widgets/input_decoration.dart';
import 'package:pattern_formatter/pattern_formatter.dart';

// Clase aun en mantenimiento
class InputCurrency extends StatelessWidget {
  final String? hint;
  final IconData? prefixIcon;
  final Color? color;
  final String? initialValue;
  final bool? readOnly;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final IconData? suffixIcon;
  final String? label;
  final int? maxLines;
  final int? maxLength;
  final double? labelFontSize;
  final Function(String)? onChange;
  final String? Function(String?)? validacion;

  const InputCurrency({
    Key? key, 
    this.hint,
    this.prefixIcon,
    this.color,
    this.initialValue,
    this.readOnly,
    this.textAlign,
    this.textStyle,
    this.suffixIcon,
    this.label,
    this.labelFontSize,
    this.maxLines,
    this.maxLength,
    required this.onChange,
    this.validacion
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          style: textStyle,
          inputFormatters: [
            LengthLimitingTextInputFormatter(maxLength ?? 20),
            ThousandsFormatter(allowFraction: true, formatter: NumberFormat.currency(locale: 'en_US', symbol: '\$ '))
          ],
          autofocus: true,
          autocorrect: false,
          keyboardType: TextInputType.number,
          readOnly: readOnly ?? false,
          maxLines: maxLines ?? 1,
          textAlign: textAlign ?? TextAlign.center,
          decoration: InputDecorations.inputDecorationPersonalizado(
            hintText: '\$ 0.00',
            labelText: label ?? '',
            prefixIcon: prefixIcon,
            labelFontSize: labelFontSize ?? 20
          ),
          onChanged: onChange,
          validator: validacion
        ),
      ],
    );
  }
}
