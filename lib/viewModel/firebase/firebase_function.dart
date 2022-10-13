import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import '../../const.dart';


class FirebaseFunctions {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  DocumentSnapshot? _lastDocument;
  var isLoading = false.obs;



  Future<String> uploadImage(File file) async {
    try {
      String imageName = generateId();

      var refrence = _storage.ref().child("/images").child("/$imageName.jpg");

      var uploadTask = await refrence.putFile(file);

      String url = await uploadTask.ref.getDownloadURL();

      return url;
    } catch (e) {
      showAlert("$e");
      return "";
    }
  }
  // Future<List<BlogsModel>> getBlogs() async {
  //   if (_hasMoreData) {
  //     if (!isLoading.value) {
  //       try {
  //         if (_lastDocument == null) {
  //           return await _firebaseFirestore
  //               .collection('blogs')
  //               .orderBy('time')
  //               .limit(_documentLimit)
  //               .get()
  //               .then((value) {
  //             _lastDocument = value.docs.last;
  //
  //             if (value.docs.length < _documentLimit) {
  //               _hasMoreData = false;
  //             }
  //
  //             Indicator.closeLoading();
  //
  //             return value.docs
  //                 .map((e) => BlogsModel.fromJson(e.data()))
  //                 .toList();
  //           });
  //         } else {
  //           isLoading.value = true;
  //
  //           return await _firebaseFirestore
  //               .collection("blogs")
  //               .orderBy('time')
  //               .startAfterDocument(_lastDocument!)
  //               .limit(_documentLimit)
  //               .get()
  //               .then((value) {
  //             _lastDocument = value.docs.last;
  //
  //             if (value.docs.length < _documentLimit) {
  //               _hasMoreData = false;
  //             }
  //
  //             isLoading.value = false;
  //
  //             return value.docs
  //                 .map((e) => BlogsModel.fromJson(e.data()))
  //                 .toList();
  //           });
  //         }
  //       } catch (e) {
  //         showAlert("$e");
  //         print(e.toString());
  //         return [];
  //       }
  //     } else {
  //       return [];
  //     }
  //   } else {
  //     print("No More Data");
  //     return [];
  //   }
  // }
  Future<void> deletePublicBlog(String id) async {
    try {
      await _firebaseFirestore.collection('blogs').doc(id).delete();
    } catch (e) {
      showAlert("$e");
    }
  }



  Future<void> create(String? id, Map<String, dynamic> map,String collection, ) async {
    try {
      id==null?
      await _firebaseFirestore.collection(collection).doc().set(map):
      await _firebaseFirestore.collection(collection).doc(id).set(map)
    ;
    } catch (e) {
      showAlert("$e");
    }
  }



}