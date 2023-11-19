import 'package:appda/models/catalogo_model.dart';
import 'package:appda/pages/catalogos/catalogo_controller.dart';
import 'package:appda/pages/catalogos/catalogo_detalle_controller.dart';
import 'package:appda/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class CatalogosPage extends StatelessWidget {

  final boxDecoration = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(116, 117, 152, 1),
        Color.fromRGBO(55, 57, 84, 1)
      ])
  );

  const CatalogosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catalogoDetalleCtrl = Get.find<CatalogoDetalleController>();
    return Scaffold(
      body: Container(
        decoration: boxDecoration,
        child: PageView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: const [
            _RegistroCatalogosPage(),
            _MuestraCatalogosPage()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          catalogoDetalleCtrl.cargarAllGastos();
          catalogoDetalleCtrl.cargarAllIngresos();
        },
        child: const Icon(Icons.refresh_outlined),
      ),
    );
  }
}

class _RegistroCatalogosPage extends StatelessWidget {
  const _RegistroCatalogosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox( height: 30 ),
              _FormCatalogo(),
              Expanded(child: Container()),
              const Text("CATÁLOGOS REGISTRADOS", style: TextStyle(color: Colors.white)),
              const Icon( Icons.keyboard_arrow_down, size: 100, color: Colors.white )
            ],
          ),
        )
      ],
    );
  }
}

class _FormCatalogo extends StatelessWidget {
  _FormCatalogo({ Key? key }) : super(key: key);
  final catalogoCtrl = Get.find<CatalogoController>();

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: GetBuilder<CatalogoDetalleController>(
        init: CatalogoDetalleController(),
        builder: (cdetalleCtrl) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              key: cdetalleCtrl.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: cdetalleCtrl.esFormularioValido,
              child: Column(
                children: [
                  const Text("Agrega un sub catálogo", style: TextStyle(fontSize: 16)),
                  InputTexto(
                    textInputType: TextInputType.name,
                    label: "Código",
                    prefixIcon: Icons.abc,
                    maxLength: 6,
                    // ignore: unnecessary_null_comparison
                    onChange: (value) => cdetalleCtrl.detalle.value.cdetalle = ((value == null) ? "" : value.capitalize)!,
                    validacion: (value) => ValidacionesInputs.validaCantidadNumeros(value.toString(), 3),
                  ),
                  InputTexto(
                    textInputType: TextInputType.text,
                    label: "Nombre",
                    prefixIcon: Icons.person_outline,
                    maxLength: 100,
                    onChange: (value) => cdetalleCtrl.detalle.value.nombre = value,
                    validacion: (value) => ValidacionesInputs.validaCantidadNumeros(value.toString(), 2),
                  ),

                  Obx( () => 
                    DropdownPersonalizado(
                      value: catalogoCtrl.detalleSelect.value.ccatalogo, 
                      onchange: catalogoCtrl.onSeleccionChange,
                      items: catalogoCtrl.lcatalogos.map<DropdownMenuItem<String>>((CatalogoModel model) {
                        return DropdownMenuItem<String>(
                          value: model.ccatalogo,
                          child: Text(model.nombre)
                        );
                      }).toList()
                    )
                  ),

                  Obx( () => 
                    CheckboxListTile(
                      title: Text("Activo?", style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black
                      )),
                      controlAffinity: ListTileControlAffinity.leading,
                      checkColor: Colors.white,
                      value: cdetalleCtrl.activo.value,
                      onChanged: cdetalleCtrl.changeActivo,
                    ),
                  ),
                  
                ]
              )
            ),

            Obx( () => 
              BotonPrimario(
                onPressed: cdetalleCtrl.esValidoForm.value 
                  ? () => cdetalleCtrl.guardarCatalogoDetalle(catalogoCtrl.detalleSelect.value.ccatalogo)
                  : null,
                label: "Guardar catálogo",
                mt: 20,
              ),
            ),
          ]
        ),
      )
    );
  }
}


class _MuestraCatalogosPage extends StatelessWidget {
  const _MuestraCatalogosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255,1,1,0),
      child: const Stack(
        children: [
          _CategoriasDetalles()          
        ]
      ),
    );
  }
}

class _CategoriasDetalles extends StatelessWidget {
  const _CategoriasDetalles({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CatalogoDetalleController>(
      builder: (catalogoDetalleCtrl) => CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: PageTitle(titulo: 'Tus categorias', subtitulo: 'Cada una de las categorias se puede ingresar más sub categorias'),
          ),
          const SliverToBoxAdapter(
            child: PageTitle(titulo: 'Ingresos'),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) {
                return ItemsPersonalizado(
                  color: Color((math.Random().nextDouble() * 0xFFFABC).toInt()).withOpacity(0.9), 
                  numeros: '${i + 1}', 
                  texto: '${catalogoDetalleCtrl.lingresos[i].nombre.capitalize}' );
              },
              childCount: catalogoDetalleCtrl.lingresos.length,
            ),
          ),
          const SliverToBoxAdapter(
            child: PageTitle(titulo: 'Gastos'),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) {
                return ItemsPersonalizado(
                  color: Color((math.Random().nextDouble() * 0xFFFABC).toInt()).withOpacity(0.9), 
                  numeros: '${i + 1}', 
                  texto: '${catalogoDetalleCtrl.lgastos[i].nombre.capitalize}' );
              },
              childCount: catalogoDetalleCtrl.lgastos.length,
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