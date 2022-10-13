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
class SalonRegister extends GetView<CreateSalonController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(


        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Add Salon',style: TextStyle(color: UIData.lightColor),),
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
                // DropDownMultiSelect(
                //   options: controller.options,
                //   whenEmpty: 'Please Select Category',
                //   decoration: InputDecoration(
                //     enabledBorder: OutlineInputBorder(
                //         borderSide:
                //         BorderSide(width: 1, color: Colors.white),
                //         borderRadius: BorderRadius.circular(10)),
                //     focusedBorder: OutlineInputBorder(
                //       borderSide:
                //       BorderSide(width: 1, color: Colors.white),
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //   ),
                //   onChanged: (value) {
                //     controller.selectedOptionList.value = value;
                //     controller.selectedOption.value =
                //     "Please Select Category";
                //     controller.selectedOptionList.value
                //         .forEach((element) {
                //       controller.selectedOption.value =
                //           controller.selectedOption.value + " " + element;
                //     });
                //   },
                //   selectedValues: controller.selectedOptionList.value,
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const  Text(
                      "Salon Name",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    TextFormWidget(textInputType: TextInputType.text, obscureText: false,controller: controller.salonName, validator: (value){validate(value);},),

                  ],
                ),
                const SizedBox(height: 10,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const   Text(
                      "Salon Address",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    TextFormWidget(textInputType: TextInputType.text, obscureText: false,validator: (value){
                      validate(value);
                    },controller: controller.salonAddress,),

                  ],
                ),

                SizedBox(height: 10,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const    Text(
                      "Salon Contact",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    TextFormWidget(textInputType: TextInputType.text, obscureText: false,validator: (value){
                      validate(value);
                    },controller: controller.salonContact,),


                  ],
                ),
                SizedBox(height: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:  [
                        Row(
                          children: const[
                            Text(
                              "From",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                            SizedBox(width: 5,),
                            Icon(Icons.access_time,color: Colors.grey,size: 20,)
                          ],
                        ),
                        Row(
                          children: const[
                            Text(
                              "To",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                            SizedBox(width: 5,),
                            Icon(Icons.access_time,color: Colors.grey,size: 20,)
                          ],
                        ),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:  [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormWidget(
                              controller: controller.from,

                              validator:(value){
                                validate(value);
                              },

                              textInputType: TextInputType.number,
                              obscureText: false,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormWidget(
                              controller:controller.to,
                              validator:(value){
                                validate(value);
                              },
                              textInputType: TextInputType.number,
                              obscureText: false,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:const [
                        Text(
                          "Braids price",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                        Text(
                          "Abuja price",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:  [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormWidget(
                              controller: controller.braids,

                              validator:(value){
                                validate(value);
                              },

                              textInputType: TextInputType.number,
                              obscureText: false,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormWidget(
                              controller:controller.abuja,
                              validator:(value){
                                validate(value);
                              },
                              textInputType: TextInputType.number,
                              obscureText: false,
                            ),
                          ),
                        ),

                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:const [
                        Text(
                          "HairCut price",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                        Text(
                          "BlowDry price",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:  [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormWidget(
                              controller: controller.hairCut,
                              validator:(value){
                                validate(value);
                              },

                              textInputType: TextInputType.number,
                              obscureText: false,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormWidget(
                              controller:controller.blowDry,
                              validator:(value){
                                validate(value);
                              },
                              textInputType: TextInputType.number,
                              obscureText: false,
                            ),
                          ),
                        )


                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:const [

                        Text(
                          "Relaxer price",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),

                        Text(
                          "Manicure price",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:  [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormWidget(
                              controller:controller.relaxer,
                              validator:(value){
                                validate(value);
                              },
                              textInputType: TextInputType.number,
                              obscureText: false,
                            ),
                          ),
                        ),

                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormWidget(
                              controller:controller.manicure,
                              validator:(value){
                                validate(value);
                              },
                              textInputType: TextInputType.number,
                              obscureText: false,
                            ),
                          ),
                        ),

                      ],
                    )
                  ],
                ),


                SizedBox(height: 20,),
                MyButton(btnText: 'Next', onpressed: ()async{
                  if(_formKey.currentState!.validate()){

                    String _fileName = basename(controller.imageFile!.path);
                    Reference _firebaseStorageRef = FirebaseStorage.instance
                        .ref()
                        .child('profilePics/$_fileName');
                    UploadTask _uploadTask =
                    _firebaseStorageRef.putFile((controller.imageFile!));
                    controller.picUrl= await (await _uploadTask).ref.getDownloadURL();
                    controller.image = controller.picUrl;

                    controller.createSalon();
                  }
                })

              ],
            ),
          ),
        ),
      ),
    );
  }
}
