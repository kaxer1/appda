import 'package:appda/pages/splash/splash_controller.dart';
import 'package:appda/pages/splash/splash_page.dart';
import 'package:appda/routes/app_pages.dart';
import 'package:appda/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
 
void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.light );

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme,
      locale: const Locale('es'),
      fallbackLocale: const Locale('es'),
      home: const SplashPage(),
      initialBinding: BindingsBuilder(() {
        Get.lazyPut<SplashController>(() => SplashController());
      }),
      getPages: AppPages.appRoutes(),
    );
  }
}
