import 'package:get/get.dart';
import '../../salonSpecialist/salonSpecialist.dart';
import '../../view/pages/MainScreen.dart';
import '../../view/pages/SalonOwner.dart';
import '../../view/pages/auth/authentication.dart';
import '../../view/pages/auth/intro.dart';
import '../../view/pages/salon_register.dart';
import '../getx_controller/auth_controller/binding.dart';
import '../getx_controller/create_salon_controller/binding.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.authentication;

  static final routes = [

    GetPage(
      name: _Paths.salonOwner,
      page: () => const SalonOwner(),
    ),
    GetPage(

      name: _Paths.authentication,
      page: () => AuthenticationPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.intro,
      page: () => IntroPage(),
    ),
    GetPage(
      name: _Paths.mainScreen,
      page: () =>  MainScreen(),
    ),
    GetPage(
      name: _Paths.salonSpecialist,
      page: () =>  SalonSpecialist(),
    ),
    GetPage(
      name: _Paths.salonRegister,
      page: () => SalonRegister(),
      binding: CreateSalonBinding(),
    ),

  ];
}