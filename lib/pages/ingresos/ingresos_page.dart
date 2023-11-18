
import 'package:appda/pages/ingresos/ingresos_controller.dart';
import 'package:appda/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class IngresosPage extends StatelessWidget {
  const IngresosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          const Background(),
          // Cards
          GetBuilder<IngresosController>(
            init: IngresosController(),
            builder: (metasCtrl) => CustomScrollView(
              slivers: <Widget>[
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: PageTitle(color: Colors.white, titulo: 'Metas de referidos',
                      subtitulo: 'Estos son los servicios que puedes obtener por completar cada una de las metas de referidos.'),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, i) {
                      return SigleCardMetas( 
                        numeros: metasCtrl.items[i].numeros, 
                        color: metasCtrl.items[i].color, 
                        icon: metasCtrl.items[i].icon, 
                        text: metasCtrl.items[i].text 
                      );
                    },
                    childCount: metasCtrl.items.length,
                  ),
                ),
              ],
            ),
          )
        ]
    );
  }
}