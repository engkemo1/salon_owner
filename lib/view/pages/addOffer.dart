import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:get/get.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:image_picker/image_picker.dart';

import '../../../const.dart';
import '../../../uidata.dart';
import '../../../viewModel/get_image.dart';
import '../../../viewModel/getx_controller/create_salon_controller/create_salon_controller.dart';
import '../component/TextFormField.dart';
import '../component/button.dart';
class Offers extends GetView<CreateSalonController> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(


        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Add Offer',style: TextStyle(color: UIData.lightColor),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Form(
            key:_formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/logo.jpeg',height: 100,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Container(
                          height: 80,width: 300,
                          decoration: BoxDecoration(
                            color: Colors.white30,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child:   InkWell(
                                onTap: () {
                                  showAnimatedDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (BuildContext context) {
                                      return Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.black12,
                                              borderRadius:
                                              BorderRadius.circular(20)),
                                          height: 120,
                                          width: MediaQuery.of(context).size.width,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                child: GestureDetector(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        height: 45,
                                                        width: 45,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                30)),
                                                        child: const Icon(
                                                          Icons.camera_alt,
                                                          color: Colors.black,
                                                          size: 35,
                                                        ),
                                                      ),
                                                      const Text(
                                                        "Camera",
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: 15,
                                                            color: Colors.white,
                                                            decoration:
                                                            TextDecoration.none),
                                                      ),
                                                    ],
                                                  ),
                                                  onTap: () async{
                                                    try {
                                                      final _pickedFile =
                                                      await ImagePicker().pickImage(
                                                        source: ImageSource.camera,

                                                      );
                                                      controller.imageFile = File(_pickedFile!.path);
                                                      Get.back();
                                                    } catch (error) {
                                                      Get.back();
                                                    }                                                },
                                                ),
                                              ),
                                              Container(
                                                child: GestureDetector(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        height: 45,
                                                        width: 45,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                30)),
                                                        child: const Icon(
                                                          Icons.photo,
                                                          color: Colors.black,
                                                          size: 35,
                                                        ),
                                                      ),
                                                      const Text(
                                                        "Gallery",
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: 15,
                                                            color: Colors.white,
                                                            decoration:
                                                            TextDecoration.none),
                                                      ),
                                                    ],
                                                  ),
                                                  onTap: () async{
                                                    try {
                                                      final _pickedFile =
                                                      await ImagePicker().pickImage(
                                                        source: ImageSource.gallery,
                                                        maxHeight: 400,
                                                        maxWidth: 400,
                                                      );
                                                      controller.imageFile = File(_pickedFile!.path);

                                                      Get.back();
                                                    } catch (error) {
                                                      Get.back();
                                                    }
                                                    String _fileName = basename(controller.imageFile!.path);

                                                    controller.image = _fileName;
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    animationType: DialogTransitionType.size,
                                    curve: Curves.fastOutSlowIn,
                                    duration: const Duration(seconds: 1),
                                  );
                                },
                                child:const Icon(Icons.camera_alt_outlined)),
                          ),
                        )),

                  ],
                ),
                const SizedBox(height: 70,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const  Text(
                      "Title",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: UIData.mainColor,fontSize: 17),
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller:controller.title ,
                      decoration: const InputDecoration(
                        hintText: 'Enter Description',
                        hintStyle: TextStyle(color: Colors.grey,fontSize: 13),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white,),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),                      ),

                    )


                  ],
                ),
                SizedBox(height: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const  Text(
                      "offer",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: UIData.mainColor,fontSize: 17),
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller:controller.offer ,
                      decoration: const InputDecoration(
                        hintText: 'Enter offer',
                        hintStyle: TextStyle(color: Colors.grey,fontSize: 13),

                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),                      ),

                    )


                  ],
                ),
                SizedBox(height: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const  Text(
                      "price",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: UIData.mainColor,fontSize: 17),
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller:controller.price ,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Enter price',
                        hintStyle: TextStyle(color: Colors.grey,fontSize: 13),

                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),                      ),

                    )


                  ],
                ),
                SizedBox(height: 30,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const  Text(
                      "Offer Description",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: UIData.mainColor,fontSize: 17),
                    ),
                    TextFormField(
                      maxLines: 5,
                      style: TextStyle(color: Colors.white),
                      controller:controller.description ,
                      decoration: const InputDecoration(
                        hintText: 'Enter Description',
                        hintStyle: TextStyle(color: Colors.grey,fontSize: 13),

                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),                      ),

                    ),

                  ],
                ),
                const SizedBox(height: 10,),


                SizedBox(height: 20,),
                MyButton(btnText: 'Add', onpressed: ()async{
                  if(_formKey.currentState!.validate()){

                    String _fileName = basename(controller.imageFile!.path);
                    Reference _firebaseStorageRef = FirebaseStorage.instance
                        .ref()
                        .child('profilePics/$_fileName');
                    UploadTask _uploadTask =
                    _firebaseStorageRef.putFile((controller.imageFile!));
                    controller.picUrl= await (await _uploadTask).ref.getDownloadURL();
                    controller.image = controller.picUrl;

                    controller.createOffer();
                  }
                }),
                SizedBox(height: 40,)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
