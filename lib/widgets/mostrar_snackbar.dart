import 'package:get/get.dart';
import 'package:appda/theme/style.dart';

mostrarErrorSnackBar(String titulo, [int duracion = 5]) {
  Get.showSnackbar(
    GetSnackBar(
      animationDuration: const Duration(milliseconds: 1000),
      duration: Duration(seconds: duracion),
      message: titulo,
      backgroundColor: colorSnackbarError,
    )
  );
}

mostrarExitoSnackBar(String titulo, [int duracion = 5]) {
  Get.showSnackbar(
    GetSnackBar(
      animationDuration: const Duration(milliseconds: 1000),
      duration: Duration(seconds: duracion),
      message: titulo,
      backgroundColor: colorSnackbarError,
    )
  );
}