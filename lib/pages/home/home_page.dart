import 'package:appda/pages/catalogos/catalogo_controller.dart';
import 'package:appda/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          const Background(),
          // Home Body
          _HomeBody()
        ],
      ),
   );
  }
}

class _HomeBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CatalogoController>(
      builder: (scanlistCtrl) => CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: PageTitle(titulo: 'Titulo', subtitulo: 'eslogan'),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0),
            delegate: SliverChildBuilderDelegate(
              (context, i) {
                return SigleCardCuadrado(
                  numeros: '${i + 1}', 
                  color: Color((math.Random().nextDouble() * 0xFFFABC).toInt()).withOpacity(0.9),
                  nombre: '${scanlistCtrl.lcatalogos[i].nombre.capitalize}',
                  celular: ""
                );
              },
              childCount: scanlistCtrl.lcatalogos.length,
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.only(bottom: 80.0),
          )
        ],
      ),
    );

  }
}