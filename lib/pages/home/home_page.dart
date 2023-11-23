import 'package:appda/pages/home/home_controller.dart';
import 'package:appda/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (homeCtrl) => CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 30),
              child: PageTitle(subtitulo: 'Aqui se presenta tus gastos por orden de ingreso.', 
                color: Colors.white, titulo: 'Historial de tus gastos'),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) {
                return SigleCardTransacciones( 
                  saldo: homeCtrl.lsaldos[i] 
                );
              },
              childCount: homeCtrl.lsaldos.length,
            ),
          ),
        ],
      )
    );

  }
}