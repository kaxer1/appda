import 'dart:ui';
import 'package:flutter/material.dart';

class SigleCardCuadrado extends StatelessWidget {

  final IconData? icon;
  final Color color;
  final String nombre;
  final String celular;
  final String numeros;

  const SigleCardCuadrado({
    Key? key,
    this.icon,
    required this.color,
    required this.nombre,
    required this.celular,
    required this.numeros
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

      return _CardBackground( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: color,
              radius: 30,
              child: icon == null 
                ? Text(numeros, style: const TextStyle( color: Colors.white, fontSize: 25 ))
                : Icon( icon, size: 35, color: Colors.white, ),
            ),
            const SizedBox( height: 10 ),
            Text( celular, textAlign:  TextAlign.center, style: const TextStyle( color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold )),
            const SizedBox( height: 10 ),
            Text( nombre, textAlign:  TextAlign.center, style: const TextStyle( color: Colors.white, fontSize: 16), maxLines: 2),
          ],
        )
      );
  }
}

class _CardBackground extends StatelessWidget {

  final Widget child;

  const _CardBackground({
    Key? key, 
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur( sigmaX: 5, sigmaY: 5 ),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20)
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}