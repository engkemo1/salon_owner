import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_owner/view/pages/MainScreen1.dart';
import '../../../view/component/indicator.dart';
import '../../../view/pages/Mainscreen2.dart';
import '../../database_local/CacheHelper.dart';
import '../../firebase/firebase_function.dart';
import '../../routes/app_pages.dart';

class CreateSalonController extends GetxController {
  final FirebaseFunctions _functions = FirebaseFunctions();
  final TextEditingController salonName = TextEditingController();
  final TextEditingController salonContact = TextEditingController();
  final TextEditingController salonAddress = TextEditingController();
  final TextEditingController specialist = TextEditingController();
  final TextEditingController from = TextEditingController();
  final TextEditingController to = TextEditingController();
  final TextEditingController braids = TextEditingController();
  final TextEditingController abuja = TextEditingController();
  final TextEditingController blowDry = TextEditingController();
  final TextEditingController hairCut = TextEditingController();
  final TextEditingController relaxer = TextEditingController();
  final TextEditingController shampoo = TextEditingController();
  final TextEditingController manicure = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController offer = TextEditingController();
  final TextEditingController title = TextEditingController();
  final TextEditingController price = TextEditingController();

  List<String> options = [
    'Braids,Abuja,BlowDry,HirCut',
    'Relaxer,Shampoo,Manicure'
  ];
  Rx<List<String>> selectedOptionList = Rx<List<String>>([]);
  var selectedOption = ''.obs;
  File? imageFile;
  String? picUrl;
  String? image;

  createOffer() async {
    try {
      _functions
          .create(
              CacheHelper.get(key: 'uid'),
              {
                'image': image,
                'description': description.text,
                'offer': offer.text,
                'title': title.text,
                'price': price.text,
                'salonId': CacheHelper.get(key: 'uid')
              },
              'offers')
          .then((value) => Get.snackbar(
              'Hello ${CacheHelper.get(key: 'name')}', 'Successfully added'));
    } catch (e) {
      Indicator.closeLoading();
    }
  }

  createCategory() async {
    try {
      _functions
          .create(
              null,
              {
                'image': image,
                'title': title.text,
              },
              'category')
          .then((value) => Get.snackbar(
              'Hello ${CacheHelper.get(key: 'name')}', 'Successfully added'));
      title.clear();
      update();
    } catch (e) {
      Indicator.closeLoading();
    }
  }

  createSalon() {
    Indicator.showLoading();

    try {
      _functions
          .create(
              CacheHelper.get(key: 'uid'),
              {
                'uid': CacheHelper.get(key: 'uid'),
                'salonName': salonName.text,
                'salonImage': image,
                'salonContact': salonContact.text,
                'salonAddress': salonAddress.text,
                'from': from.text,
                'salonId': CacheHelper.get(key: 'salonId'),
                'to': to.text,
                'blowDry': blowDry.text,
                'relaxer': relaxer.text,
                'hairCut': hairCut.text,
                'abuja': abuja.text,
                'manicure': manicure.text,
                'braids': braids.text
              },
              'salon')
          .then((value) {
        CacheHelper.put(key: 'salonImage', value: image);
        CacheHelper.put(key: 'salonName', value: salonName.text);
        CacheHelper.put(key: 'salonContact', value: salonContact.text);
        CacheHelper.put(key: 'to', value: to.text);
        CacheHelper.put(key: 'from', value: from.text);
        CacheHelper.put(key: 'salonAddress', value: salonAddress.text);
        CacheHelper.put(key: 'blowDry', value: blowDry.text);
        CacheHelper.put(key: 'relaxer', value: relaxer.text);
        CacheHelper.put(key: 'abuja', value: abuja.text);
        CacheHelper.put(key: 'manicure', value: manicure.text);
        CacheHelper.put(key: 'braids', value: braids.text);

        Indicator.closeLoading();
        Get.offAll(MainScreen2());
      });
    } catch (e) {
      Indicator.closeLoading();
    }
  }

  updateSalon() {
    FirebaseFirestore.instance
        .collection('salon')
        .doc(CacheHelper.get(key: 'uid'))
        .update({
      'salonName': salonName.text,
      'salonImage': image,
      'salonContact': salonContact.text,
      'salonAddress': salonAddress.text,
      'from': from.text,
      'to': to.text,
      'blowDry': blowDry.text,
      'relaxer': relaxer.text,
      'hairCut': hairCut.text,
      'abuja': abuja.text,
      'manicure': manicure.text,
      'braids': braids.text
    }).then((value) => Get.snackbar('Hello sir', 'Successfully updated'));
  }
}
