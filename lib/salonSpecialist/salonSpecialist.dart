import 'package:flutter/material.dart';

import '../../uidata.dart';
import '../view/pages/profile/profileScreen.dart';

class SalonSpecialist extends StatefulWidget {
  const SalonSpecialist({Key? key}) : super(key: key);

  @override
  State<SalonSpecialist> createState() => _SalonSpecialistState();
}

class _SalonSpecialistState extends State<SalonSpecialist>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                    'https://media.istockphoto.com/photos/young-woman-looking-for-changes-trying-new-hairstyle-at-beauty-salon-picture-id1271712634?k=20&m=1271712634&s=612x612&w=0&h=QbbNRe9lNjOmpC_tCCQZkSpWaYY_VHXdo9VCz59DnkA='),
              ),
              Positioned(
                bottom: 10,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text('LooHair Stylist',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    SizedBox(height: 4),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                right: 20,
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.location_on_outlined,
                        size: 23, color: Colors.red),
                    SizedBox(width: 2),
                    Text("18th ad. banha",
                        style: TextStyle(color: Colors.black, fontSize: 15))
                  ],
                ),
              ),
            ],
          ),
          TabBar(
            tabs: [
              Tab(
                text: 'Appoinment',
              ),
              Tab(
                text: 'Profile',
              )
            ],
            controller: _tabController,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            labelColor: UIData.mainColor,
            indicatorColor: UIData.lightColor,
            indicatorSize: TabBarIndicatorSize.label,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Card(
                          margin: EdgeInsets.all(20),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 22,
                                      backgroundImage: AssetImage(
                                        "images/profile.jpg",
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'kemo magdy',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          '8:00:8:30',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: UIData.mainColor,
                                            borderRadius:
                                            BorderRadius.circular(10.0),
                                          ),
                                          height: 25,
                                          width: 60,
                                          child: TextButton(
                                            onPressed: () {

                                            },
                                            child: Text(
                                              "Approve",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 8,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                            BorderRadius.circular(10.0),
                                          ),
                                          height: 25,
                                          width: 60,
                                          child: TextButton(
                                            onPressed: () {

                                            },
                                            child: Text(
                                              "Reject",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 8,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Phone:',
                                          style: TextStyle(
                                              color: UIData.mainColor),
                                        ),
                                        SizedBox(width: 2),
                                        Text("0722000000",
                                            style: TextStyle(
                                                color: Colors.grey[700],
                                                fontSize: 12))
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )),
                      Card(
                          margin: EdgeInsets.all(20),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 22,
                                      backgroundImage: AssetImage(
                                        "images/profile.jpg",
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'kemo magdy',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          '8:00:8:30',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: UIData.mainColor,
                                            borderRadius:
                                            BorderRadius.circular(10.0),
                                          ),
                                          height: 25,
                                          width: 60,
                                          child: TextButton(
                                            onPressed: () {

                                            },
                                            child: Text(
                                              "Approve",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 8,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                            BorderRadius.circular(10.0),
                                          ),
                                          height: 25,
                                          width: 60,
                                          child: TextButton(
                                            onPressed: () {

                                            },
                                            child: Text(
                                              "Reject",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 8,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Phone:',
                                          style: TextStyle(
                                              color: UIData.mainColor),
                                        ),
                                        SizedBox(width: 2),
                                        Text("0722000000",
                                            style: TextStyle(
                                                color: Colors.grey[700],
                                                fontSize: 12))
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )),
                      Card(
                          margin: EdgeInsets.all(20),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 22,
                                      backgroundImage: AssetImage(
                                        "images/profile.jpg",
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'kemo magdy',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          '8:00:8:30',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: UIData.mainColor,
                                            borderRadius:
                                            BorderRadius.circular(10.0),
                                          ),
                                          height: 25,
                                          width: 60,
                                          child: TextButton(
                                            onPressed: () {

                                            },
                                            child: Text(
                                              "Approve",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 8,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                            BorderRadius.circular(10.0),
                                          ),
                                          height: 25,
                                          width: 60,
                                          child: TextButton(
                                            onPressed: () {

                                            },
                                            child: Text(
                                              "Reject",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 8,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Phone:',
                                          style: TextStyle(
                                              color: UIData.mainColor),
                                        ),
                                        SizedBox(width: 2),
                                        Text("0722000000",
                                            style: TextStyle(
                                                color: Colors.grey[700],
                                                fontSize: 12))
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )),
                      Card(
                          margin: EdgeInsets.all(20),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 22,
                                      backgroundImage: AssetImage(
                                        "images/profile.jpg",
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'kemo magdy',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          '8:00:8:30',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: UIData.mainColor,
                                            borderRadius:
                                            BorderRadius.circular(10.0),
                                          ),
                                          height: 25,
                                          width: 60,
                                          child: TextButton(
                                            onPressed: () {

                                            },
                                            child: Text(
                                              "Approve",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 8,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                            BorderRadius.circular(10.0),
                                          ),
                                          height: 25,
                                          width: 60,
                                          child: TextButton(
                                            onPressed: () {

                                            },
                                            child: Text(
                                              "Reject",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 8,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Phone:',
                                          style: TextStyle(
                                              color: UIData.mainColor),
                                        ),
                                        SizedBox(width: 2),
                                        Text("0722000000",
                                            style: TextStyle(
                                                color: Colors.grey[700],
                                                fontSize: 12))
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
                UserProfileScreen()
              ],
            ),
          )
        ]),
      ),
    );
  }
}
