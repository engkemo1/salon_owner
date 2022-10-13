import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../uidata.dart';
import '../../viewModel/database_local/CacheHelper.dart';

class Specialists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: UIData.darkColor,
        centerTitle: true,
        title: const Text(
          'Specialists',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 70),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .where('salonId',
                        isEqualTo: CacheHelper.get(key: 'salonId'))
                    .snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(
                        backgroundColor: UIData.mainColor,
                      ),
                    );
                  } else {
                    var snap = snapshot.data.docs;

                    return ListView.builder(
                      itemBuilder: (context, index) => Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: 290,
                          height: 260,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                alignment: AlignmentDirectional.center,
                                width: 290,
                                height: 200,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            snap[index]['imageUrl']),
                                        fit: BoxFit.cover)),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(snap[index]['name'],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600)),
                                      Row(
                                        children: <Widget>[
                                          Icon(Icons.phone,
                                              size: 19,
                                              color: Colors.grey[700]),
                                          SizedBox(width: 2),
                                          Text(snap[index]['phone'],
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 12))
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      itemCount: snap.length,
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
