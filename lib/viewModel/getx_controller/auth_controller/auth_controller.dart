import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';


import '../../../model/user_model.dart';
import '../../../view/component/indicator.dart';
import '../../../view/pages/auth/intro.dart';
import '../../database_local/CacheHelper.dart';
import '../../routes/app_pages.dart';

class AuthController extends GetxController  with GetSingleTickerProviderStateMixin {
  static AuthController instance = Get.find();
  final TextEditingController emailLogin = TextEditingController();
  final TextEditingController passwordLogin = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController salonId = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  TabController? tabController;
  late Rx<User?> _user;

  User get user => _user.value!;
  var isSignedIn = false.obs;
File? imagFile;
String? image;
String?picUrl;
  var selected = "Role type".obs;
  void setSelected(String value){
    selected.value = value;
  }
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController
     = TabController(vsync: this, length: 2);


}
  @override
  void onClose() {
  email.dispose();
  password.dispose();
  phone.dispose();
  salonId.dispose();
  fullName.dispose();
    tabController!.dispose();
    super.onClose();
  }


  @override
  void onReady() {

    super.onReady();
    _user = Rx<User?>(_auth.currentUser);
    _user.bindStream(_auth.authStateChanges());
    ever(_user, _setInitialScreen);
  }



  _setInitialScreen(User? user) {
    if (user==null) {
      Get.offAllNamed(Routes.authentication);    }
      else {
        Get.offAllNamed(Routes.mainScreen);
      }
    }



  void onLogin() async {
    try {
      Indicator.showLoading();


      if (emailLogin.text.isNotEmpty && passwordLogin.text.isNotEmpty) {
        await _auth
            .signInWithEmailAndPassword(email: emailLogin.text, password: passwordLogin.text)
            .then((value) {
              getUser(email: emailLogin.text);});
        update();
      CacheHelper.put(key: 'uid', value: user.uid);
        email.clear();
        password.clear();

        Indicator.closeLoading();

      } else {
        Indicator.closeLoading();

        Get.snackbar(
          'Error Logging in',
          'Please enter all the fields',
        );
      }
    } catch (e) {
      Indicator.closeLoading();

      Get.snackbar(
        'Error Loggin gin',
        e.toString(),
      );
    }



  }
  _saveUser(UserModel user) async {
    log("email: ${user.uid}");

    CacheHelper.put(key: 'uid', value: user.uid!);
    CacheHelper.put(key: 'name', value: user.name!);
    CacheHelper.put(key: 'email', value: user.email!);
    CacheHelper.put(key: 'phone', value: user.phone!);
    CacheHelper.put(key: 'password', value: user.password!);
    CacheHelper.put(key: 'role', value: user.role!);
    CacheHelper.put(key: 'image', value: user.imageUrl);
    CacheHelper.put(key: 'salonId', value: user.salonId);

  }

  Future<void> getUser({required String email}) async {
    await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((value) {
      for (var result in value.docs) {
        UserModel user = UserModel(
          password: result.get('password'),
          uid: result.id,
          email: result.get('email'),
          name: result.get('name'),
          phone: result.get('phone'), role:  result.get('role'),

           imageUrl: result.get('imageUrl'), salonId: result.get('salonId'),

        );


        _saveUser(user);
      }
    });
  }


  void onCreateAccount() async {
    try {
      Indicator.showLoading();

      // save out user to our ath and firebase firestore
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      ) ;
      Get.offAllNamed(Routes.salonRegister);

update();
      // String downloadUrl = await _uploadToStorage(image);
      UserModel user1 = UserModel(
          name: fullName.text,
          email: email.text,
          phone: phone.text,
          uid: cred.user!.uid,
         password: password.text, role: 'salonOwner', salonId: salonId.text, imageUrl: image);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(cred.user!.uid)
          .set(user1.toJson());

      _saveUser(user1);

      emailLogin.clear();
      passwordLogin.clear();
      email.clear();phone.clear();confirmPassword.clear();
      Indicator.closeLoading();

    } catch (e) {
      Indicator.closeLoading();

      Get.snackbar(
        'Error Creating Account',
        e.toString(),
      );
    }
  }


  void signout() async {
    Indicator.showLoading();

    try {

      await _auth.signOut().then((value) {
        isSignedIn.value = false;
        update();


        CacheHelper.removeData(key: 'role');

        CacheHelper.removeData(key: 'uid');
        Get.offAll(() => IntroPage());
      });

      Indicator.closeLoading();

    } catch (e) {
      Indicator.closeLoading();

      Get.snackbar('Error occured!', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: Colors.blue);
    }
  }
 updateInformation()async{
   await FirebaseFirestore.instance
       .collection('users')
       .doc(CacheHelper.get(key: 'uid'))
       .update({
     'password': password.text.isNotEmpty
         ? password.text
         : CacheHelper.get(key: 'password'),
     'name': fullName.text.isNotEmpty
         ? fullName.text
         : CacheHelper.get(key: 'name'),
     'email': email.text.isNotEmpty
         ? email.text
         : CacheHelper.get(key: 'email'),
     'phone': phone.text.isNotEmpty
         ? phone.text
         : CacheHelper.get(key: 'phone'),


   }).then((value) {
     CacheHelper.put(
       key: 'name',
       value: fullName.text.isNotEmpty
           ? fullName.text
           : CacheHelper.get(key: 'name'),
     );
     CacheHelper.put(
         key: 'email',
         value: email.text.isNotEmpty
             ? email.text
             : CacheHelper.get(key: 'email'));
     CacheHelper.put(
         key: 'phone', value:  phone.text.isNotEmpty
         ? phone.text
         : CacheHelper.get(key: 'phone'));

     CacheHelper.put(
       key: 'password',
       value: password.text.isNotEmpty
           ? password.text
           : CacheHelper.get(key: 'password'),
     );


   });

}
}