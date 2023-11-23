import 'package:appda/models/catalogo_detalle_model.dart';
import 'package:appda/services/db_services.dart';
import 'package:appda/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CatalogoDetalleController extends GetxController {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<CatalogoDetalleModel> lcatalogosdetalle = <CatalogoDetalleModel>[].obs;
  List<CatalogoDetalleModel> lgastos = <CatalogoDetalleModel>[].obs;
  List<CatalogoDetalleModel> lingresos = <CatalogoDetalleModel>[].obs;

  RxBool esValidoForm = false.obs;
  RxBool activo = false.obs;
  final detalle = CatalogoDetalleModel(ccatalogo: "", cdetalle: "", nombre: "", activo: 0).obs;
  
  @override
  void onReady() {
    cargarAllGastos();
    cargarAllIngresos();
    super.onReady();
  }

  void changeActivo (bool? value) {
    activo.value = value ?? false;
    detalle.value.activo = detalle.value.booleanToInt(value);
  }

  void esFormularioValido() {
    esValidoForm.value = false;
    if (formKey.currentState?.validate() != true) return;
    if (!activo.value) return;
    esValidoForm.value = true;
  }

  cargarAllCatalogosDetalles() async {
    final listaResp = await DBServices.db.getListaEntidad("catalogodetalle", CatalogoDetalleModel(activo: 0, cdetalle: "", ccatalogo: "", nombre: ""));
    lcatalogosdetalle = [...listaResp];
    update();
  }

  cargarAllGastos() async {
    Map<String, dynamic> filtro = { 'ccatalogo': 'GAS'};
    final listaResp = await DBServices.db.getListaEntidad("catalogodetalle", CatalogoDetalleModel(activo: 0, cdetalle: "", ccatalogo: "", nombre: ""), filtro: filtro);
    lgastos = [...listaResp];
    update();
  }

  cargarAllIngresos() async {
    Map<String, dynamic> filtro = { 'ccatalogo': 'ING'};
    final listaResp = await DBServices.db.getListaEntidad("catalogodetalle", CatalogoDetalleModel(activo: 0, cdetalle: "", ccatalogo: "", nombre: ""), filtro: filtro);
    lingresos = [...listaResp];
    update();
  }

  guardarCatalogoDetalle(String ccatalogo) async{
    detalle.value.ccatalogo = ccatalogo;
    // ignore: void_checks
    if (detalle.value.cdetalle == "") return mostrarExitoSnackBar("Falta seleccionar catalogo principal");
    detalle.value.cdetalle = detalle.value.cdetalle.toUpperCase();
    detalle.value.nombre = detalle.value.nombre.toUpperCase();
    try {
      await DBServices.db.insertarEntity("catalogodetalle", detalle.value);
      lcatalogosdetalle.add(detalle.value);
    } catch (e) {
      mostrarExitoSnackBar("Error al insertar catalogo");
    }
    
    update();
  }

  // buscandoRefrido(String busqueda) {
  //   scansReferidosParticipantes = [..._auxParticipantes];
  //   scansReferidosParticipantes.retainWhere((scans){
  //     return scans.toString().toLowerCase().contains(busqueda.toLowerCase());
  //   });
  // }

}

