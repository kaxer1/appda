import 'package:appda/widgets/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Widget que se usa en los formularios
class InputTexto extends StatelessWidget {
  
  final String? hint;
  final bool? obscureText;
  final IconData? prefixIcon;
  final Color? color;
  final String? initialValue;
  final bool? readOnly;
  final TextAlign? textAlign;
  final IconData? suffixIcon;
  final TextInputType? textInputType;
  final String? label;
  final int? maxLines;
  final int? maxLength;
  final String? Function(String)? onChange;
  final String? Function(String?)? validacion;
  final Function? onTapIcon; // permite realizar algo al presionar en el icono

  const InputTexto({
    Key? key, 
    this.hint,
    this.obscureText,
    this.prefixIcon,
    this.color,
    this.initialValue,
    this.readOnly,
    this.textAlign,
    this.suffixIcon,
    this.textInputType,
    this.label,
    this.maxLines,
    this.maxLength,
    required this.onChange,
    this.validacion,
    this.onTapIcon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(maxLength ?? 255),
          ],
          autocorrect: false,
          obscureText: obscureText ?? false,
          keyboardType: textInputType,
          readOnly: readOnly ?? false,
          maxLines: maxLines ?? 1,
          textAlign: textAlign ?? TextAlign.left,
          decoration: InputDecorations.inputDecorationPersonalizado(
            hintText: hint ?? '',
            labelText: label ?? '',
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            onTap: onTapIcon
          ),
          onChanged: onChange,
          validator: validacion
        ),
      ],
    );
  }
}
