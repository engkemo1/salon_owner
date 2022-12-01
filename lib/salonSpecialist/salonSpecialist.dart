import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_owner/viewModel/database_local/CacheHelper.dart';

import '../../uidata.dart';

class SalonSpecialist extends StatefulWidget {
  const SalonSpecialist({Key? key}) : super(key: key);

  @override
  State<SalonSpecialist> createState() => _SalonSpecialistState();
}

class _SalonSpecialistState extends State<SalonSpecialist>
    with SingleTickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    print(CacheHelper.get(key: '321231232123132'));

    print(CacheHelper.get(key: 'role'));
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('salon')
                    .where('salonId',
                        isEqualTo: CacheHelper.get(key: 'salonId'))
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
                      Stack(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(snap[0]['salonImage'])),
                              Container(
                                color: Colors.black45,
                              )
                            ],
                          ),
                          Positioned(
                            top: 20,
                            left: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 10),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Colors.black54),
                                  padding: EdgeInsets.only(
                                      left: 10, bottom: 5, top: 5, right: 30),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.home_work,
                                        color: UIData.mainColor,
                                      ),
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
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            right: 20,
                            child: Container(
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.black54),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.location_on_outlined,
                                      size: 23, color: Colors.red),
                                  SizedBox(width: 2),
                                  Text(snap[0]['salonAddress'],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15))
                                ],
                              ),
                            ),
                          ),
                        ],
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
                                  .where('specialistId',
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
                                        height: 500,
                                        child: ListView.builder(
                                          itemBuilder: (context, index) => Card(
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
                                                                  'customerImage']),
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
                                                              snap2[index][
                                                                  'customerName'],
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 14),
                                                            ),
                                                            const SizedBox(
                                                              height: 6,
                                                            ),
                                                            Text(
                                                              '${snap2[index]['from']}:${snap2[index]['to']}',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        !snap2[index]
                                                                ['approved']
                                                            ? Row(
                                                                children: [
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: UIData
                                                                          .mainColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    height: 25,
                                                                    width: 60,
                                                                    child:
                                                                        TextButton(
                                                                      onPressed:
                                                                          () async {
                                                                        await FirebaseFirestore
                                                                            .instance
                                                                            .collection(
                                                                                'oppoinments')
                                                                            .doc(snap2[index]
                                                                                .id)
                                                                            .update({
                                                                          'approved':
                                                                              true
                                                                        }).then((value) =>
                                                                                Get.snackbar('Hello Sir', 'Successfully approved'));
                                                                      },
                                                                      child:
                                                                          const Text(
                                                                        "Approve",
                                                                        style:
                                                                            TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontSize:
                                                                              8,
                                                                          color:
                                                                              Colors.black,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .red,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    height: 25,
                                                                    width: 60,
                                                                    child:
                                                                        TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        FirebaseFirestore
                                                                            .instance
                                                                            .collection('oppoinments')
                                                                            .doc(snap2[index].id)
                                                                            .delete();
                                                                      },
                                                                      child:
                                                                          const Text(
                                                                        "Reject",
                                                                        style:
                                                                            TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontSize:
                                                                              8,
                                                                          color:
                                                                              Colors.black,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              )
                                                            : Row(
                                                                children: const [
                                                                  Text(
                                                                    'Booked',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .green,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Icon(
                                                                    Icons
                                                                        .check_circle,
                                                                    color: Colors
                                                                        .green,
                                                                  )
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
                                                            SizedBox(width: 2),
                                                            Text(
                                                                snap2[index]
                                                                    ['phone'],
                                                                style: TextStyle(
                                                                    color: Colors
                                                                            .white
                                                                     ,
                                                                    fontSize:
                                                                        12))
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )),
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
