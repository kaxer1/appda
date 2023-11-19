import 'package:appda/routes/export_pages.dart';
import 'package:appda/pages/catalogos/catalogos_page.dart';
import 'package:appda/pages/catalogos/catalogo_controller.dart';
import 'package:appda/pages/catalogos/catalogo_detalle_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Navegacion extends StatelessWidget {
  const Navegacion({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    Get.put(CatalogoController());
    Get.put(CatalogoDetalleController());
    return GetBuilder<NavegacionController>(
      builder: (navegacion) => Obx(
        () => Scaffold(
          body: navegacion._children[navegacion.menuIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (index) => navegacion.seleccionaMenu(index),
            showSelectedLabels: true,
            showUnselectedLabels: false,
            selectedItemColor: Get.theme.primaryColor,
            currentIndex: navegacion.menuIndex.value,
            items: navegacion.items,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }
}

// Controlador de la navegacion.
class NavegacionController extends GetxController {
  RxInt menuIndex = 0.obs;

  final List<Widget> _children = [
    const HomePage(),
    const IngresosPage(),
    const CatalogosPage(),
  ];

  final List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon( Icons.supervised_user_circle_outlined ),
      label: 'Referidos'
    ),
    const BottomNavigationBarItem(
      icon: Icon( Icons.trending_up_outlined ),
      label: 'Metas'
    ),
    const BottomNavigationBarItem(
      icon: Icon( Icons.description ),
      label: 'Información'
    )
  ];

  void seleccionaMenu (index) {
    menuIndex.value = index;
  }
}