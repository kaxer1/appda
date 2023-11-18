import 'package:flutter/material.dart';
import 'package:get/get.dart' ;


class botonesEliminarEditar extends StatelessWidget {
  final Function? onPressEditar;
  final Function? onPressEliminar;
  const botonesEliminarEditar({
    Key? key,
    this.onPressEditar,
    this.onPressEliminar
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton.icon(
            icon: const Icon( Icons.edit ),
            onPressed: onPressEditar as void Function()?,
            label: Text(
              "Editar",
              textAlign: TextAlign.center,
              style: Get.textTheme.subtitle1!.copyWith(
              color: Get.theme.scaffoldBackgroundColor),
            ),
          ),
          ElevatedButton.icon(
            icon: const Icon( Icons.delete ),
            onPressed: onPressEliminar as void Function()?,
            style: ElevatedButton.styleFrom( primary: Colors.red),
            label: Text(
              "Eliminar",
              textAlign: TextAlign.center,
              style: Get.textTheme.subtitle1!.copyWith(
              color: Get.theme.scaffoldBackgroundColor),
            ),
          )
        ]
      ),
    );
  }
}
