import 'package:appda/models/catalogo_detalle_model.dart';
import 'package:appda/models/saldos_model.dart';
import 'package:appda/pages/home/calcular_saldos.dart';
import 'package:appda/services/db_services.dart';
import 'package:appda/widgets/mostrar_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IngresosGastosController extends GetxController {

  GlobalKey<FormState> formKeyIngresos = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyGastos = GlobalKey<FormState>();

  final comboIngresoSelect = CatalogoDetalleModel(ccatalogo: "", cdetalle: "-", nombre: "...", activo: 0).obs;
  final comboGastoSelect = CatalogoDetalleModel(ccatalogo: "", cdetalle: "-", nombre: "...", activo: 0).obs;
  final _default = CatalogoDetalleModel(ccatalogo: "", cdetalle: "-", nombre: "...", activo: 0);
  final _saldoIngresos = SaldosModel(ccatalogo: "", cdetalle: "", monto: 0, debito: 1);
  final _saldoGasto = SaldosModel(ccatalogo: "", cdetalle: "", monto: 0, debito: 1);
  
  List<CatalogoDetalleModel> lingresos = <CatalogoDetalleModel>[].obs;
  List<CatalogoDetalleModel> lgastos = <CatalogoDetalleModel>[].obs;

  RxBool esValidoFormIngresos = false.obs;
  RxBool esValidoFormGasto = false.obs;

  @override
  void onInit() {
    lingresos.add(_default);
    lgastos.add(_default);
    cargarGastosActivos();
    cargarIngresosActivos();
    super.onInit();
  }

  /// Metodos inicio Gastos
  onChangeMontoIngresos(String valor) {
    try {
      final cleanedValue = valor.replaceAll("\$ ", "").replaceAll(",", "");
      final monto = double.tryParse(cleanedValue) ?? 0.0;
      _saldoIngresos.monto = monto;
    } catch (e) {
      mostrarExitoSnackBar(e.toString());
    }
  }

  onSeleccionIngresosChange(String? valor) {
    final objeto = lingresos.where((o) => o.cdetalle == valor);
    if (objeto.isEmpty) return;
    comboIngresoSelect.value = objeto.first;
    _saldoIngresos.ccatalogo = comboIngresoSelect.value.ccatalogo;
    _saldoIngresos.cdetalle = comboIngresoSelect.value.cdetalle;
    _saldoIngresos.nombretransaccion = comboIngresoSelect.value.nombre;
  }

  void esFormularioValidoIngresos() {
    esValidoFormIngresos.value = false;
    if (comboIngresoSelect.value.cdetalle == "-") return;
    if (formKeyIngresos.currentState?.validate() != true) return;
    esValidoFormIngresos.value = true;
  }
  /// fin Gastos

  /// Metodos inicio Gastos
  onChangeMontoGastos(String valor) {
    try {
      final cleanedValue = valor.replaceAll("\$ ", "").replaceAll(",", "");
      final monto = double.tryParse(cleanedValue) ?? 0.0;
      _saldoGasto.monto = monto;
    } catch (e) {
      mostrarExitoSnackBar(e.toString());
    }
  }

  onSeleccionGastosChange(String? valor) {
    final objeto = lgastos.where((o) => o.cdetalle == valor);
    if (objeto.isEmpty) return;
    comboGastoSelect.value = objeto.first;
    _saldoGasto.ccatalogo = comboGastoSelect.value.ccatalogo;
    _saldoGasto.cdetalle = comboGastoSelect.value.cdetalle;
    _saldoGasto.nombretransaccion = comboGastoSelect.value.nombre;
  }

  void esFormularioValidoGastos() {
    esValidoFormGasto.value = false;
    if (comboGastoSelect.value.cdetalle == "-") return;
    if (formKeyGastos.currentState?.validate() != true) return;
    esValidoFormGasto.value = true;
  }
  /// fin Gastos


  cargarIngresosActivos() async {
    Map<String, dynamic> filtro = { 'ccatalogo': 'ING', 'activo': 1};
    final listaResp = await DBServices.db.getListaEntidad("catalogodetalle", _default, filtro: filtro);
    lingresos = [...listaResp];
    lingresos.insert(0, _default);
    update();
  }

  cargarGastosActivos() async {
    Map<String, dynamic> filtro = { 'ccatalogo': 'GAS', 'activo': 1};
    final listaResp = await DBServices.db.getListaEntidad("catalogodetalle", _default, filtro: filtro);
    lgastos = [...listaResp];
    lgastos.insert(0, _default);
    update();
  }

  guardarRegistro(int esdebito) async{ // debito 1, credito 0
    try {
      if (esdebito == 0) {
        _saldoIngresos.debito = esdebito;
        _saldoIngresos.fingreso = DateTime.timestamp();
        if (_saldoIngresos.cdetalle == "" || _saldoIngresos.ccatalogo == "" ) return mostrarExitoSnackBar("Falta seleccionar un ingreso");
        await Saldos(movimientoActual: _saldoIngresos).calcular();
        await DBServices.db.insertarEntity("saldos", _saldoIngresos);
      }
      if (esdebito == 1) {
        _saldoGasto.debito = esdebito;
        _saldoGasto.fingreso = DateTime.timestamp();
        if (_saldoGasto.cdetalle == "" || _saldoGasto.ccatalogo == "" ) return mostrarExitoSnackBar("Falta seleccionar un gasto");
        await Saldos(movimientoActual: _saldoGasto).calcular();
        await DBServices.db.insertarEntity("saldos", _saldoGasto);
      }
      comboIngresoSelect.value = _default;
      comboGastoSelect.value = _default;
      onChangeMontoGastos("0");
      onChangeMontoIngresos("0");
    } catch (e) {
      mostrarExitoSnackBar("Error al insertar los datos");
    }
    
    update();
  }

}