import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salon_owner/view/pages/MainScreen1.dart';
import 'package:salon_owner/view/pages/Mainscreen2.dart';
import 'package:salon_owner/view/pages/auth/authentication.dart';
import 'package:salon_owner/viewModel/database_local/CacheHelper.dart';
import 'package:salon_owner/viewModel/getx_controller/auth_controller/auth_controller.dart';
import 'package:salon_owner/viewModel/getx_controller/create_salon_controller/create_salon_controller.dart';
import 'firebase_options.dart';
import 'viewModel/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthController()));
  Get.put(CreateSalonController());

  print(CacheHelper.get(key: '321231232123132'));

  print(CacheHelper.get(key: 'role'));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Salon-App",
      home: CacheHelper.get(key: 'role') == 'SalonOwner'
          ? MainScreen2()
          : CacheHelper.get(key: 'role') == 'Specialist'
          ? MainScreen()
          : AuthenticationPage(),
      theme: ThemeData(
        textTheme: GoogleFonts.ubuntuTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
