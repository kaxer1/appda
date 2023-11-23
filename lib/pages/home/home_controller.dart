import 'package:appda/models/saldos_model.dart';
import 'package:appda/services/db_services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  
  List<SaldosModel> lsaldos = <SaldosModel>[].obs;
  final _saldoDefault = SaldosModel(ccatalogo: "", cdetalle: "", monto: 0, debito: 1);

  @override
  void onInit() {
    lsaldos.add(_saldoDefault);
    cargarSaldos();
    super.onInit();
  }
  
  cargarSaldos() async {
    final listaResp = await DBServices.db.getListaEntidad("saldos", _saldoDefault, orderby: 'id desc');
    lsaldos = [...listaResp];
    update();
  }

}
