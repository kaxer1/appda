import 'package:appda/services/db_services.dart';
import 'package:get/get.dart';


class ScanListController extends GetxController {

  List<ScanModel> scans = <ScanModel>[].obs;
  List<ScanModel> lreferidos = <ScanModel>[].obs;
  List<ScanModel> scansReferidosParticipantes = <ScanModel>[].obs;
  List<ScanModel> _auxParticipantes = <ScanModel>[].obs;

  Future<ScanModel> nuevoScan( ScanModel nuevoScan ) async {

    await DBServices.db.nuevoScan(nuevoScan);
    
    scans.add(nuevoScan);
    update();
    return nuevoScan;
  }

  @override
  void onInit() {
    cargarScansReferidosParticipantes();
    super.onInit();
  }
  
  @override
  void onReady() {
    cargarScans();
    super.onReady();
  }

  cargarScans() async {
    final referidos = await DBServices.db.getTodosLosScans();
    scans = [...referidos];
    update();
  }
  
  cargarScansReferidosParticipantes() async {
    final referidos = await DBServices.db.getMiembrosReferidos();
    scansReferidosParticipantes = [...referidos];
    _auxParticipantes = [...referidos];
    update();
  }

  buscandoRefrido(String busqueda) {
    scansReferidosParticipantes = [..._auxParticipantes];
    scansReferidosParticipantes.retainWhere((scans){
      return scans.toString().toLowerCase().contains(busqueda.toLowerCase());
    });
  }

  cargarScansByIdPadre(String idPadre) async {
    final referidos = await DBServices.db.getScanByIdPadre(idPadre);
    lreferidos = [...referidos];
    update();
  }

  borrarTodos() async {
    await DBServices.db.deleteAllScans();
    scans = [];
    update();
  }

  borrarScanPorId( int id ) async {
    await DBServices.db.deleteScan(id);
    update();
  }

}

