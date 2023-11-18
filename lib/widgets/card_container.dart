import 'package:flutter/material.dart';

// Widget que crea un Card y recibe otro widget para mostrarlo dentro del card.
class CardContainer extends StatelessWidget {

  final Widget child;
  final double ? paddingHorizontal; 
  final double ? paddingVertical; 
  final Function? onTap;

  const CardContainer({
    Key? key, 
    required this.child,
    this.paddingHorizontal,
    this.paddingVertical,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric( horizontal: paddingHorizontal ?? 30, vertical: paddingVertical ?? 0 ),
      child: GestureDetector(
        onTap: onTap as void Function()?,
        child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all( 20 ),
            decoration: _createCardShape(),
            child: child,
        ),
      ),
    );
  }

  BoxDecoration _createCardShape() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 15,
        offset: Offset(0, 5),
      )
    ]
  );
}