import 'package:appda/models/entidad.dart';

class CatalogoModel extends EntidadModel {
    
    String ccatalogo;
    String nombre;
    int activo;

    CatalogoModel({
        required this.ccatalogo ,
        required this.nombre,
        required this.activo,
    });

    @override
    Map<String, dynamic> toJson() => {
      "ccatalogo": ccatalogo,
      "nombre": nombre,
      "activo": activo,
    };
    
    @override
    CatalogoModel fromJson(Map<String, dynamic> json) {
      return CatalogoModel(
        ccatalogo: json["ccatalogo"],
        nombre: json["nombre"],
        activo: json["activo"],
      );
    }

    @override
    void limpiarEntidad() {
      ccatalogo = "";
      nombre = "";
      activo = 0;
    }

}
