

import 'package:appda/models/saldos_model.dart';
import 'package:appda/services/db_services.dart';

class Saldos {

  SaldosModel? ultimoMovimiento;
  SaldosModel movimientoActual;
  List<SaldosModel> lsaldos = <SaldosModel>[];

  Saldos({
    required this.movimientoActual
  });


  calcular() async {
    await _consultarUltimoSaldo();
    if (movimientoActual.debito == 1) {
      movimientoActual.saldoanterior = ultimoMovimiento!.saldoanterior! - movimientoActual.monto;
    }
    if (movimientoActual.debito == 0) {
      movimientoActual.saldoanterior = ultimoMovimiento!.saldoanterior! + movimientoActual.monto;
    }
  }

  _consultarUltimoSaldo() async {
    final listaResp = await DBServices.db.getListaEntidad("saldos", movimientoActual, orderby: 'id desc', limit: 1);
    lsaldos = [...listaResp];
    ultimoMovimiento = lsaldos[0];
  }

  
}

