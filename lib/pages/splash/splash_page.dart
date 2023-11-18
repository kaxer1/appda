import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appda/pages/splash/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (_) => Scaffold(
        backgroundColor: Get.theme.splashColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage('assets/logo.png')),
            const SizedBox(height: 20),
            Center(
              child: CircularProgressIndicator( 
                backgroundColor: Get.theme.primaryColor,
                color: Get.theme.scaffoldBackgroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
