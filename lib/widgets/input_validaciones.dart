import 'package:get/get.dart';

class ValidacionesInputs {

  static validarEmail ( value ) {

    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp  = RegExp(pattern);
    
    return regExp.hasMatch(value ?? '') 
    ? null 
    : "El correo electrónico no es valido";
  }

  static validarContrasenia( value ) {
    return ( value != null && value.length >= 12 ) 
    ? null 
    : 'validarPassword'.tr;
  }

  static validarArgumentosIguales(String value1, String value2, msg ) {
    if (value1.isEmpty) return null;
    if (value2.isEmpty) return null;

    return ( value1 == value2 ) 
    ? null 
    : msg;
  }
  
  // valida el ingreso del nombre de usuario
  static validarNombreUsuario( String value, String msg ) {
    if (value.isEmpty) return;
    if (value.length > 10) return;
    String pattern = r'^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{12,16}$';
    RegExp regExp  = RegExp(pattern);
    return regExp.hasMatch(value) 
      ? null 
      : msg;
  }

  // Valida la confirmacion de la contrasenia
  static validarRepeticionContrasenia( value1, value2 ) {
    var validaContrasenia = validarContrasenia(value1);
    if (validaContrasenia != null) return 'validarPassword'.tr;
    var validaArgumentosIguales = validarArgumentosIguales(value1, value2, 'Las contraseñas no coinciden');
    return (validaContrasenia == null) ? validaArgumentosIguales : null;

  }

  // aun falta por pulir la validacion de cedula correcta
  static validarCedula( String value ) {
    if (value.isEmpty) return;
    String pattern = r'^([0-9])*\S{10,10}$';
    RegExp regExp  = RegExp(pattern);
    return regExp.hasMatch(value) 
      ? null 
      : 'Número de cédula no valido';
  }

  // Valida celular
  static validarCelular( String value ) {
    if (value.isEmpty) return;
    String pattern = r'^([0-9])*\S{10,10}$';
    RegExp regExp  = RegExp(pattern);
    return regExp.hasMatch(value) 
      ? null 
      : 'Número de celular no valido';
  }
}