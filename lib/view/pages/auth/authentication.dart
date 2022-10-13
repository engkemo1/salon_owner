import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:salon_owner/const.dart';
import 'package:salon_owner/view/component/TextFormField.dart';

import '../../../uidata.dart';
import '../../../viewModel/getx_controller/auth_controller/auth_controller.dart';


class AuthenticationPage extends GetView<AuthController> {
  AuthenticationPage({super.key});

  String val = 'Customer';
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Container(
        child: Column(
          children: [

            Container(
              width: MediaQuery.of(context).size.width,
              height: 350,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 7.0,
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    spreadRadius: 5.0,
                  ),
                ],
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    alignment: Alignment.center,
                    height: 250,
                    child: const Center(
                      child: Image(
                          height: 249,
                          image: AssetImage(
                            "images/logo.jpeg",
                          )),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: TabBar(
                      unselectedLabelColor: Colors.grey,
                      labelColor: Colors.white,
                      labelStyle: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                      tabs: const [
                        Tab(
                          text: '        Login        ',
                        ),
                        Tab(
                          text: '       Sign-up       ',
                        ),
                      ],
                      controller: controller.tabController,
                      indicatorWeight: 4,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: UIData.mainColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: [
                  Center(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 40.0, right: 40.0, top: 60.0),
                        child: SingleChildScrollView(
                          child: Form(
                            key:_formKey,
                              child:Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "SalonId",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey),
                                      ),
                                      TextFormWidget(
                                          validator: (val) {
                                            validateEmail(val);
                                          },

                                          controller: controller.salonId,
                                          textInputType: TextInputType.text,
                                          obscureText: false),
                                    ],
                                  ),

                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Email address",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey),
                                      ),
                                      TextFormWidget(
                                          validator: (val) {
                                            validateEmail(val);
                                          },
                                          controller: controller.emailLogin,
                                          textInputType: TextInputType.emailAddress,
                                          obscureText: false),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Password",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey),
                                      ),
                                      TextFormWidget(
                                          validator: (val) {
                                            validatePassword(val);
                                          },
                                          controller: controller.passwordLogin,
                                          textInputType:
                                          TextInputType.visiblePassword,
                                          obscureText: true),
                                    ],
                                  ),


                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: UIData.mainColor,
                                        borderRadius: BorderRadius.circular(25)),
                                    height: 50,
                                    width: 200,
                                    child: TextButton(
                                      onPressed: () {
                                        controller.onLogin();
                                      },
                                      child: const Text(
                                        "Sign In",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  )
                                ],
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 40.0, right: 40.0, top: 60.0),
                        child:Form(
                          key: _formKey2,
                          child:  Column(
                            children: [
                              Center(
                                  child: Container(
                                    height: 100, width: 100,
                                    decoration:const BoxDecoration(
                                        color: UIData.darkColor,
                                        shape: BoxShape.circle),
                                    child: Center(
                                      child: InkWell(
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
                                                    width: MediaQuery
                                                        .of(context)
                                                        .size
                                                        .width,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceAround,
                                                      children: [
                                                        Container(
                                                          child: GestureDetector(
                                                            child: Column(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                              children: [
                                                                Container(
                                                                  height: 45,
                                                                  width: 45,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          30)),
                                                                  child: const Icon(
                                                                    Icons.camera_alt,
                                                                    color: Colors
                                                                        .black,
                                                                    size: 35,
                                                                  ),
                                                                ),
                                                                const Text(
                                                                  "Camera",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                      FontWeight.bold,
                                                                      fontSize: 15,
                                                                      color: Colors
                                                                          .white,
                                                                      decoration:
                                                                      TextDecoration
                                                                          .none),
                                                                ),
                                                              ],
                                                            ),
                                                            onTap: () async {
                                                              try {
                                                                final pickedFile =
                                                                await ImagePicker()
                                                                    .pickImage(
                                                                  source: ImageSource
                                                                      .camera,

                                                                );
                                                                controller.imagFile =
                                                                    File(pickedFile!
                                                                        .path);
                                                                Get.back();
                                                              } catch (error) {
                                                                Get.back();
                                                              }
                                                            },
                                                          ),
                                                        ),
                                                        Container(
                                                          child: GestureDetector(
                                                            child: Column(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                              children: [
                                                                Container(
                                                                  height: 45,
                                                                  width: 45,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          30)),
                                                                  child: const Icon(
                                                                    Icons.photo,
                                                                    color: Colors
                                                                        .black,
                                                                    size: 35,
                                                                  ),
                                                                ),
                                                                const Text(
                                                                  "Gallery",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                      FontWeight.bold,
                                                                      fontSize: 15,
                                                                      color: Colors
                                                                          .white,
                                                                      decoration:
                                                                      TextDecoration
                                                                          .none),
                                                                ),
                                                              ],
                                                            ),
                                                            onTap: () async {
                                                              try {
                                                                final _pickedFile =
                                                                await ImagePicker()
                                                                    .pickImage(
                                                                  source: ImageSource
                                                                      .gallery,
                                                                  maxHeight: 400,
                                                                  maxWidth: 400,
                                                                );
                                                                controller.imagFile =
                                                                    File(_pickedFile!
                                                                        .path);

                                                                Get.back();
                                                              } catch (error) {
                                                                Get.back();
                                                              }
                                                              String fileName = basename(
                                                                  controller
                                                                      .imagFile!
                                                                      .path);

                                                              controller.image =
                                                                  fileName;
                                                            },
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                              animationType: DialogTransitionType
                                                  .size,
                                              curve: Curves.fastOutSlowIn,
                                              duration: const Duration(seconds: 1),
                                            );
                                          },
                                          child: const Icon(
                                              Icons.camera_alt_outlined,color: UIData.mainColor,size: 25,)),
                                    ),
                                  )),
SizedBox(height: 20,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Name",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  ),
                                  TextFormWidget(
                                      validator: (val) {
                                        validate(val);
                                      },
                                      controller: controller.fullName,
                                      textInputType: TextInputType.name,
                                      obscureText: false),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Email address",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  ),
                                  TextFormWidget(
                                      validator: (val) {
                                        validateEmail(val);
                                      },
                                      controller: controller.email,
                                      textInputType: TextInputType.emailAddress,
                                      obscureText: false),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Password",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  ),
                                  TextFormWidget(
                                      controller: controller.password,
                                      textInputType:
                                      TextInputType.visiblePassword,
                                      validator: (val) {
                                        validatePassword(val);
                                      },
                                      obscureText: true),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Confirom Password",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  ),
                                  TextFormWidget(
                                    validator: (val) {
                                      validateEmail(val);
                                      if (val != controller.password) {
                                        return 'Password not match';
                                      }
                                    },
                                    textInputType: TextInputType.visiblePassword,
                                    obscureText: true,
                                    controller: controller.confirmPassword,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Phone",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  ),
                                  TextFormWidget(
                                    validator: (val) {
                                      validateEmail(val);

                                    },
                                    textInputType: TextInputType.phone,
                                    obscureText: false,
                                    controller: controller.phone,
                                  )
                                ],
                              ),

                              const SizedBox(
                                height: 20,
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "SalonId",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  ),
                                  TextFormWidget(
                                    validator: (val) {
                                      validateEmail(val);

                                    },
                                    textInputType: TextInputType.text,
                                    obscureText: false,
                                    controller: controller.salonId,
                                  )
                                ],
                              ),

                              const SizedBox(
                                height: 20,
                              ),

                              Theme(
                                data: Theme.of(context)
                                    .copyWith(canvasColor: Colors.black38),
                                child: DropdownButtonFormField(
                                    style: const TextStyle(color: Colors.black),
                                    hint: const Text(
                                      'please Select role',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    items: ['Specialist', 'SalonOwner']
                                        .map((label) => DropdownMenuItem(
                                      value: label,
                                      child: Text(
                                        label.toString(),
                                        style: const TextStyle(
                                            color: Colors.grey),
                                      ),
                                    ))
                                        .toList(),
                                    decoration: const InputDecoration(

                                        focusedBorder: OutlineInputBorder(
                                            borderSide:
                                            BorderSide(color: Colors.grey)),
                                        border: OutlineInputBorder(
                                            borderSide:
                                            BorderSide(color: Colors.grey))),
                                    onChanged: (String? value) {
                                      controller.setSelected(value!);
                                    }),
                              ),
                              const SizedBox(
                                height: 20,
                              ),

                              Container(
                                decoration: BoxDecoration(
                                    color: UIData.mainColor,
                                    borderRadius: BorderRadius.circular(25)),
                                height: 50,
                                width: 200,
                                child: TextButton(
                                  onPressed: () async{

                                    if (_formKey2.currentState!.validate())
                                    {
                                      String _fileName = basename(controller.imagFile!
                                          .path);
                                      Reference _firebaseStorageRef = FirebaseStorage
                                          .instance
                                          .ref()
                                          .child('profilePics/$_fileName');
                                      UploadTask _uploadTask =
                                      _firebaseStorageRef.putFile((controller
                                          .imagFile!));
                                      controller.picUrl = await(await _uploadTask).ref
                                          .getDownloadURL();
                                      controller.image = controller.picUrl;

                                      controller.onCreateAccount();


                                    }
                                  },
                                  child: const Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              )
                            ],
                          ),
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
