import 'dart:ui';
import 'package:flutter/material.dart';

class SigleCardMetas extends StatelessWidget {

  final IconData icon;
  final Color color;
  final String text;
  final String numeros;

  const SigleCardMetas({
    Key? key,
    required this.icon,
    required this.color,
    required this.text,
    required this.numeros,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CardBackground( 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 20),
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Text(numeros, style: const TextStyle( color: Colors.white, fontSize: 25 ))
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text( text , style: const TextStyle( color: Colors.white70, fontSize: 18 ), 
                      maxLines: 2, overflow: TextOverflow.ellipsis)
          )
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
      height: 100,
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur( sigmaX: 5, sigmaY: 5 ),
          child: Container(
            height: 10,
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