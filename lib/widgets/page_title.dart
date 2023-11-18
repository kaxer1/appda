import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {

  final Color? color;
  final String titulo;
  final String? subtitulo;
  final double? mx;
  final double? my;

  const PageTitle({super.key, required this.titulo, this.subtitulo, this.color, this.mx, this.my});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric( horizontal: mx ?? 20 , vertical: my ?? 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(titulo, style: TextStyle( fontSize: 28, fontWeight: FontWeight.bold, color: color ?? Colors.white  )),
            const SizedBox( height: 10 ),
            Text(subtitulo ?? "", style: TextStyle( fontSize: 20, color: color ?? Colors.white )),
          ],
        ),
      ),
    );
  }
}