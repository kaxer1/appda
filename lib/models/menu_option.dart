import 'package:flutter/material.dart' show IconData;

class MenuOption {

  final String? route;
  final IconData icon;
  final String name;
  final Function onPress;

  MenuOption({
    required this.icon,
    required this.name,
    required this.onPress,
    this.route,
  });

}


