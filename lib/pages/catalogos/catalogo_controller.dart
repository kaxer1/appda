import 'package:appda/models/catalogo_model.dart';
import 'package:appda/services/db_services.dart';
import 'package:get/get.dart';


class CatalogoController extends GetxController {

  List<CatalogoModel> lcatalogos = <CatalogoModel>[].obs;
  final catalogoSelect = CatalogoModel(ccatalogo: "", nombre: "...", activo: 0).obs;
  final _defaultCatalogo = CatalogoModel(ccatalogo: "", nombre: "...", activo: 0);

  @override
  void onInit() {
    lcatalogos.add(_defaultCatalogo);
    cargarCatalogo();
    super.onInit();
  }

  cargarCatalogo() async {
    final listaResp = await DBServices.db.getListaEntidad("catalogo", CatalogoModel(activo: 0, ccatalogo: "", nombre: ""));
    lcatalogos = [...listaResp];
    lcatalogos.insert(0, _defaultCatalogo);
    update();
  }

  onSeleccionChange(String? valor) {
    final objeto = lcatalogos.where((o) => o.ccatalogo == valor);
    if (objeto.isEmpty) return;
    catalogoSelect.value = objeto.first;
  }

}

