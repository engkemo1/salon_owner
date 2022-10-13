import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import '../../../const.dart';
import '../../../uidata.dart';
import '../../../viewModel/database_local/CacheHelper.dart';
import '../../../viewModel/getx_controller/auth_controller/auth_controller.dart';
import '../../component/button.dart';

class EditInformation extends GetView<AuthController> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios,color: UIData.mainColor,),onPressed: (){Get.back();},),
        centerTitle: true,
        title: const Text(
          'Edit Information',
          style: TextStyle(color: Colors.white, fontSize: 20,),
        ),
      ),
      body: SafeArea(
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                          child: CircleAvatar(
                            backgroundColor: UIData.darkColor,
                            radius: 80,
                            child: Center(
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 80,
                                )),
                          )),
                      InkWell(
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
                                        borderRadius: BorderRadius.circular(
                                            20)),
                                    height: 120,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        GestureDetector(
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
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: Colors.white,
                                                    decoration:
                                                    TextDecoration.none),
                                              ),
                                            ],
                                          ),
                                          onTap: () {

                                          },
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
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      fontSize: 15,
                                                      color: Colors.white,
                                                      decoration:
                                                      TextDecoration.none),
                                                ),
                                              ],
                                            ),
                                            onTap: () {

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
                              duration: Duration(seconds: 1),
                            );
                          },
                          child: Icon(Icons.edit,color: UIData.mainColor,))
                    ],
                  ),
                  Container(
                      height: 80,
                      child: Center(
                        child: ListTile(
                            leading: const Text(
                              'Name:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                color: Colors.white,
                                height: 1.5833333333333333,
                              ),
                            ),
                            subtitle: TextFormField(
                              validator: (val) {
                                validate(val!);
                              },
                              keyboardType: TextInputType.name,
                              style: TextStyle(color: Colors.grey),
                              controller: controller.fullName
                                ..text = CacheHelper.get(key: 'name') ?? '',
                              onChanged: (text) => {},
                              decoration: const InputDecoration(
                                contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                border: InputBorder.none,
                              ),
                            )),
                      )),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),

                  SizedBox(
                      height: 80,
                      child: Center(
                        child: ListTile(
                            leading: const Text(
                              'Phone:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                color: Colors.white,
                                height: 1.5833333333333333,
                              ),
                            ),
                            subtitle: TextFormField(
                              autovalidateMode: AutovalidateMode.always,
                              validator: (val) {
                                validate(val!);
                              },
                              keyboardType: TextInputType.phone,
                              style: const TextStyle(color: Colors.grey),
                              controller: controller.phone
                                ..text = CacheHelper.get(key: 'phone') ?? '',
                              onChanged: (text) => {},
                              decoration: const InputDecoration(
                                contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                border: InputBorder.none,
                              ),
                            )),
                      )),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),


                  SizedBox(
                    height: 80,
                    child: Center(
                        child: ListTile(
                            leading: const Text(
                              'Email:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                color: Colors.white,
                                height: 1.5833333333333333,
                              ),
                            ),
                            subtitle: TextFormField(
                              validator: (val) {
                                validateEmail(val!);
                              },
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(color: Colors.grey),
                              decoration: const InputDecoration(
                                contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                border: InputBorder.none,
                              ),
                              controller: controller.email
                                ..text = CacheHelper.get(key: 'email') ?? '',
                              onChanged: (text) => {},
                            ))),
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  Container(
                    height: 80,
                    child: Center(
                        child: ListTile(
                            leading: const Text(
                              'password:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                color: Colors.white,
                                height: 1.5833333333333333,
                              ),
                            ),
                            subtitle: TextFormField(
                              validator: (val) {
                                validatePassword(val!);
                              },
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              style: const TextStyle(color: Colors.grey),
                              decoration: const InputDecoration(
                                contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                border: InputBorder.none,
                              ),
                              controller: controller.password..text = '',
                              onChanged: (text) => {},
                            ))),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  MyButton(btnText: 'Save', onpressed: () {
                    controller.updateInformation();
                  },)
                ],
              ),
            ],
          )),
    );
  }
}
