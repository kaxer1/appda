import 'package:flutter/material.dart';

class ItemsPersonalizado extends StatelessWidget {

  final IconData? icon;
  final Color color;
  final String texto;
  final String numeros;

  const ItemsPersonalizado({
    Key? key,
    this.icon,
    required this.color,
    required this.texto,
    required this.numeros,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

      return _CardBackground( 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: color,
              radius: 20,
              child: icon == null 
                ? Text(numeros, style: const TextStyle( color: Colors.white, fontSize: 20 ))
                : Icon( icon, size: 25, color: Colors.white, ),
            ),
            const SizedBox( width: 15 ),
            Expanded( child: Text( texto , style: const TextStyle( color: Colors.white70, fontSize: 16), 
              textAlign: TextAlign.justify, maxLines: 4, overflow: TextOverflow.ellipsis))          
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
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: child,
    );
  }
}