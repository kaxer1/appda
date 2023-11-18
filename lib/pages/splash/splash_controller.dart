import 'package:get/get.dart';

import 'package:appda/routes/app_routes.dart';

class SplashController extends GetxController {

  @override
  void onReady() {
    _init();
  }

  _init() async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      Get.offNamed( AppRoutes.NAVEGACION);
    } catch (e) {
      print(e);
    }
  }
}
