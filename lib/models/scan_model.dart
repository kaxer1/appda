import 'dart:convert';

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));
String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
    
    String id;
    String? idPadre;
    String nombres;
    String apellidos;
    String email;
    String celular;
    String? fingreso;

    ScanModel({
        required this.id ,
        required this.nombres,
        required this.apellidos,
        required this.email,
        required this.celular,
        this.idPadre,
        this.fingreso,
    });

    factory ScanModel.fromJson(Map<String, dynamic> json ) => ScanModel(
        id: json["id"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        email: json["email"],
        celular: json["celular"],
        fingreso: json["fingreso"],
        idPadre: json["idPadre"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombres": nombres,
        "apellidos": apellidos,
        "email": email,
        "celular": celular,
        "fingreso": fingreso,
        "idPadre": idPadre,
    };

    @override
    String toString() {
        return '$nombres $apellidos $celular';
    }
}
