import 'package:get/get.dart';
import 'export_pages.dart';
import 'package:appda/routes/app_routes.dart';

class AppPages {

  static appRoutes() => [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashPage(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      binding: BindingsBuilder(() {
        Get.lazyPut<SplashController>(() => SplashController());
      }),
    ),
    GetPage(
      name: AppRoutes.NAVEGACION,
      page: () => const Navegacion(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      binding: BindingsBuilder(() {
        Get.lazyPut<NavegacionController>(() => NavegacionController());
      }),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      binding: BindingsBuilder(() {
        Get.lazyPut<HomeController>(() => HomeController());
      }),
    ),
    GetPage(
      name: AppRoutes.METAS_REFERIDOS,
      page: () => const IngresosPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      binding: BindingsBuilder(() {
        Get.lazyPut<IngresosController>(() => IngresosController());
      }),
    )
  ];

}
// routes: {
//   'basic_design' : ( _ ) => BasicDesignScreen(),
//   'scroll_screen': ( _ ) => ScrollScreen(), 
//   'home_screen'  : ( _ ) => HomeScreen(), 
// },