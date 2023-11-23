import 'package:appda/models/entidad.dart';

class CatalogoDetalleModel extends EntidadModel {
    
    String ccatalogo;
    String cdetalle;
    String nombre;
    int activo;

    CatalogoDetalleModel({
        required this.ccatalogo,
        required this.cdetalle,
        required this.nombre,
        required this.activo,
    });

    @override
    Map<String, dynamic> toJson() => {
      "ccatalogo": ccatalogo,
      "cdetalle": cdetalle,
      "nombre": nombre,
      "activo": activo,
    };
    
    @override
    CatalogoDetalleModel fromJson(Map<String, dynamic> json) {
      return CatalogoDetalleModel(
        ccatalogo: json["ccatalogo"] ?? "",
        cdetalle: json["cdetalle"] ?? "",
        nombre: json["nombre"] ?? "",
        activo: json["activo"] ?? 0,
      );
    }

    int booleanToInt(bool? activo) => (activo == null) ? 0 : (activo == false ? 0 : 1);
    bool intToBoolean(int? activo) => (activo == null) ? false : (activo == 0 ? false : true);
    
    @override
    void limpiarEntidad() {
      ccatalogo = "";
      cdetalle = "";
      nombre = "";
      activo = 0;
    }

}
