import 'dart:math';

import 'package:flutter/material.dart';

class Background extends StatelessWidget {

  final boxDecoration = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.2, 0.8],
        colors: [
          Color(0xff2E305F),
          Color(0xff202333)
        ]
      )
  );

  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Purple Gradinet
        Container(decoration: boxDecoration ),

        // Pink box
        Positioned(
          top: -100,
          left: -30,
          child: _PinkBox()
        ),
      ],
    );
  }
}


class _PinkBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 5,
      child: Container(
        width: 360,
        height: 360,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 232, 135, 24),
              Color.fromARGB(255, 241, 180, 142),
              // Color.fromRGBO(236, 98, 188, 1),
              // Color.fromRGBO(241, 142, 172, 1),
            ]
          )
        ),
      ),
    );
  }
}