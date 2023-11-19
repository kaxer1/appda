import 'package:appda/models/catalogo_model.dart';
import 'package:appda/services/db_services.dart';
import 'package:get/get.dart';


class CatalogoController extends GetxController {

  List<CatalogoModel> lcatalogos = <CatalogoModel>[].obs;
  final detalleSelect = CatalogoModel(ccatalogo: "", nombre: "...", activo: 0).obs;
  final _defaultCatalogo = CatalogoModel(ccatalogo: "", nombre: "...", activo: 0);


  // Future<CatalogoModel> nuevoScan( CatalogoModel nuevoScan ) async {

  //   await DBServices.db.nuevoScan(nuevoScan);
    
  //   scans.add(nuevoScan);
  //   update();
  //   return nuevoScan;
  // }

  @override
  void onInit() {
    lcatalogos.add(_defaultCatalogo);
    cargarCatalogo();
    super.onInit();
  }
  
  // @override
  // void onReady() {
  //   super.onReady();
  // }

  cargarCatalogo() async {
    final entidadResp = await DBServices.db.getListaEntidad("catalogo", CatalogoModel(activo: 0, ccatalogo: "", nombre: ""));
    lcatalogos = [...entidadResp];
    lcatalogos.insert(0, _defaultCatalogo);
    update();
  }

  onSeleccionChange(String? valor) {
    final objeto = lcatalogos.where((o) => o.ccatalogo == valor);
    if (objeto.isEmpty) return;
    detalleSelect.value = objeto.first;
  }

  // buscandoRefrido(String busqueda) {
  //   scansReferidosParticipantes = [..._auxParticipantes];
  //   scansReferidosParticipantes.retainWhere((scans){
  //     return scans.toString().toLowerCase().contains(busqueda.toLowerCase());
  //   });
  // }

}

