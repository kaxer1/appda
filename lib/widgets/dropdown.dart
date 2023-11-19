import 'package:appda/theme/style.dart';
import 'package:flutter/material.dart';

class DropdownPersonalizado extends StatelessWidget {
  final String value;
  final List<DropdownMenuItem<String>>? items;
  final Function(String?)? onchange;

  const DropdownPersonalizado({
    super.key,
    required this.value,
    required this.items,
    required this.onchange,
  });


  @override
  Widget build(BuildContext context) {

    return DropdownButton<String>(
      value: value,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      isExpanded: true,
      // style: TextStyle(color: themeStyle.primaryColor),
      underline: Container(
        height: 2,
        color: colorInputDecorations,
      ),
      items: items,
      onChanged: onchange,
    );
  }
}