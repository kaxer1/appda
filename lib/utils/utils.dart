// import 'package:flutter/material.dart';

// launchURL( BuildContext context, ScanModel scan  ) async {

//   final url = scan.valor;

//   if ( scan.tipo == 'http' ) {
//     // Abrir el sitio web
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }

//   } else {
//     Navigator.pushNamed(context, 'mapa', arguments: scan );
//   }

// }