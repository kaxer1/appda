import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleCardModel {
    IconData icon;
    Color color;
    String text;
    String numeros;

    SingleCardModel({
        required this.icon,
        required this.color,
        required this.text,
        required this.numeros,
    });

}

class IngresosController extends GetxController {

  final items = <SingleCardModel>[
    SingleCardModel( numeros: "5",color: Colors.blueAccent, icon: Icons.car_rental, text: 'ABC Frenos' ),
    SingleCardModel( numeros: "10",color: Colors.indigo, icon: Icons.car_rental, text: 'ABC Motor' ),
    SingleCardModel( numeros: "15",color: Colors.deepPurpleAccent, icon: Icons.car_rental, text: 'Scanner Multimarca' ),
  ].obs;

}