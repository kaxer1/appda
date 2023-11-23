import 'package:appda/models/entidad.dart';

class SaldosModel extends EntidadModel {
    
    int? id;
    String ccatalogo;
    String cdetalle;
    double monto;
    int debito;
    double? saldoanterior;
    DateTime? fingreso;
    String? nombretransaccion;

    SaldosModel({
      this.id,
      required this.ccatalogo,
      required this.cdetalle,
      required this.monto,
      required this.debito,
      this.saldoanterior,
      this.nombretransaccion,
      this.fingreso,
    });

    @override
    Map<String, dynamic> toJson() => {
      "id" : id,
      "ccatalogo" : ccatalogo,
      "cdetalle" : cdetalle,
      "monto" : monto,
      "debito" : debito,
      "saldoanterior" : saldoanterior,
      "nombretransaccion" : nombretransaccion,
      "fingreso" : fingreso == null ? null : fingreso!.toIso8601String()
    };
    
    @override
    SaldosModel fromJson(Map<String, dynamic> json) {
      return SaldosModel(
        id: json["id"] ?? 0,
        ccatalogo: json["ccatalogo"] ?? "",
        cdetalle: json["cdetalle"] ?? "",
        monto: json["monto"] ?? 0.0,
        debito: json["debito"] ?? 0,
        saldoanterior: json["saldoanterior"] ?? 0.0,
        nombretransaccion: json["nombretransaccion"] ?? "",
        fingreso: DateTime.tryParse(json["fingreso"]),
      );
    }
    
    @override
    void limpiarEntidad() {
      id = 0;
      ccatalogo = "";
      cdetalle = "";
      monto = 0;
      saldoanterior = 0;
      debito = 0;
      saldoanterior = 0;
      nombretransaccion = "";
      fingreso = null;
    }

}
