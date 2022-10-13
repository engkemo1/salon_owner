part of 'app_pages.dart';


abstract class Routes {
  Routes._();

  static const home = _Paths.home;
  static const authentication = _Paths.authentication;
  static const intro = _Paths.intro;
  static const salonRegister = _Paths.salonRegister;
  static const addSpecialist = _Paths.addSpecialist;
  static const salonOwner = _Paths.salonOwner;
  static const bookPage = _Paths.bookPage;
  static const mainScreen = _Paths.mainScreen;
  static const salonSpecialist = _Paths.salonSpecialist;

}

abstract class _Paths {
  static const home = '/home';
  static const salonOwner = '/salonOwner';
  static const bookPage = '/bookPage';
  static const mainScreen = '/mainScreen';
  static const salonSpecialist = '/salonSpecialist';

  static const salonRegister = '/salonRegister';
  static const addSpecialist = '/addSpecialist';

  static const authentication = '/authentication';

  static const intro = '/intro';

}