import 'dart:ui';
import 'package:appda/models/saldos_model.dart';
import 'package:flutter/material.dart';

class SigleCardTransacciones extends StatelessWidget {

  final SaldosModel saldo;

  const SigleCardTransacciones({
    Key? key,
    required this.saldo
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CardBackground( 
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text( saldo.nombretransaccion == null ? "" : saldo.nombretransaccion! , style: const TextStyle( color: Colors.white, fontSize: 18 ), 
                        maxLines: 2, overflow: TextOverflow.fade),
                  Text(saldo.fingreso.toString().split(".")[0] , style: const TextStyle( color: Colors.white70, fontSize: 13 ), 
                        maxLines: 2, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            Expanded(child: Container()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text( (saldo.debito == 1 ? "- " : "+ ") + saldo.monto.toString() , 
                  style: TextStyle( color: saldo.debito == 1 ? Colors.red : Colors.green, fontSize: 18 ), 
                      maxLines: 2, overflow: TextOverflow.ellipsis),
                Text( saldo.saldoanterior == null ? "" : saldo.saldoanterior.toString() , 
                  style: TextStyle( color: saldo.saldoanterior == null || saldo.saldoanterior! < 0  ? Colors.red : Colors.white, fontSize: 16 ), 
                      maxLines: 2, overflow: TextOverflow.fade)
              ],
            )
          ],
        ),
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
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
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