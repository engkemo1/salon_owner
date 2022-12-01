import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:salon_owner/viewModel/database_local/CacheHelper.dart';

import '../../uidata.dart';

class SalonOwner extends StatefulWidget {
  const SalonOwner({Key? key}) : super(key: key);

  @override
  State<SalonOwner> createState() => _SalonOwnerState();
}

class _SalonOwnerState extends State<SalonOwner>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('salon')
                    .where('uid', isEqualTo: CacheHelper.get(key: 'uid'))
                    .snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator.adaptive(
                        backgroundColor: UIData.mainColor,
                      ),
                    );
                  } else {
                    var snap = snapshot.data.docs;

                    return Column(children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            color: UIData.mainColor),
                        padding: EdgeInsets.only(
                            left: 10, bottom: 10, top: 10, right: 30),
                        child: Row(
                          children: [
                            Icon(Icons.home_work),
                            SizedBox(
                              width: 6,
                            ),
                            Text(snap[0]['salonName'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 30,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white12),
                              child: Center(
                                child: const Text(
                                  'All appointments',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                          StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('oppoinments')
                                  .where('salonId',
                                      isEqualTo: CacheHelper.get(key: 'uid'))
                                  .snapshots(),
                              builder: (context, AsyncSnapshot snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: CircularProgressIndicator.adaptive(
                                      backgroundColor: UIData.mainColor,
                                    ),
                                  );
                                } else {
                                  var snap2 = snapshot.data.docs;

                                  if (snap2.length == 0) {
                                    return Center(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            SizedBox(
                                              height: 150,
                                            ),
                                            Text('No appointments yet',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ]),
                                    );
                                  } else {
                                    return SizedBox(
                                        height: MediaQuery.of(context).size.height-50,
                                        child: ListView.builder(
                                          itemBuilder: (context, index) =>
                                              Dismissible(
                                            key: Key(''),
                                            child: Card(
                                                color: UIData.darkColor,
                                                margin: EdgeInsets.all(20),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          CircleAvatar(
                                                            radius: 22,
                                                            backgroundImage:
                                                                NetworkImage(snap2[
                                                                        index][
                                                                    'specialistImage']),
                                                          ),
                                                          const SizedBox(
                                                            width: 20,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                snap2[index]
                                                                    ['name'],
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        14),
                                                              ),
                                                              SizedBox(
                                                                height: 6,
                                                              ),
                                                              Text(
                                                                '${snap2[index]['from']}:${snap2[index]['to']}',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                              snap2[index][
                                                                      'approved']
                                                                  ? Row(
                                                                      children: const [
                                                                        Text(
                                                                          'Booked',
                                                                          style: TextStyle(
                                                                              color: Colors.green,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              10,
                                                                        ),
                                                                        Icon(
                                                                          Icons
                                                                              .check_circle,
                                                                          color:
                                                                              Colors.green,
                                                                        )
                                                                      ],
                                                                    )
                                                                  : SizedBox()
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                'Specialist name: ',
                                                                style: TextStyle(
                                                                    color: UIData
                                                                        .mainColor,
                                                                    fontSize:
                                                                        10),
                                                              ),
                                                              Text(
                                                                snap2[index][
                                                                    'specialistName'],
                                                                style: TextStyle(
                                                                    color: UIData
                                                                        .lightColor,
                                                                    fontSize:
                                                                        10),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                'Customer name: ',
                                                                style: TextStyle(
                                                                    color: UIData
                                                                        .mainColor,
                                                                    fontSize:
                                                                        10),
                                                              ),
                                                              Text(
                                                                snap2[index][
                                                                    'customerName'],
                                                                style: TextStyle(
                                                                    color: UIData
                                                                        .lightColor,
                                                                    fontSize:
                                                                        10),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Row(
                                                            children: [
                                                              const Text(
                                                                'Phone:',
                                                                style: TextStyle(
                                                                    color: UIData
                                                                        .mainColor),
                                                              ),
                                                              SizedBox(
                                                                  width: 2),
                                                              Text(
                                                                  snap2[index]
                                                                      ['phone'],
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                              .grey[
                                                                          700],
                                                                      fontSize:
                                                                          12))
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                            onDismissed: (va) {
                                              FirebaseFirestore.instance
                                                  .collection('oppoinments')
                                                  .doc(snap2[index].id)
                                                  .delete()
                                                  .then((value) => Get.snackbar(
                                                      'Hello ${CacheHelper.get(key: 'name')}',
                                                      'Removed'));
                                            },
                                          ),
                                          itemCount: snap2.length,
                                        ));
                                  }
                                }
                              }),
                        ],
                      ),
                    ]);
                  }
                })),
      ),
    );
  }
}
