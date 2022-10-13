import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:salon_owner/viewModel/database_local/CacheHelper.dart';

import '../../uidata.dart';


class SalonOwner extends StatefulWidget {
  const SalonOwner({Key? key}) : super(key: key);

  @override
  State<SalonOwner> createState() => _SalonOwnerState();
}

class _SalonOwnerState extends State<SalonOwner>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(

        child:SingleChildScrollView(
          child:

        StreamBuilder(
        stream: FirebaseFirestore.instance.collection('salon').where('uid',isEqualTo: CacheHelper.get(key: 'uid')).snapshots(),
    builder: (context, AsyncSnapshot snapshot) {
    if(  snapshot.connectionState == ConnectionState.waiting){
    return Center(
    child: CircularProgressIndicator.adaptive(
    backgroundColor: UIData.mainColor,
    ),
    );}else{
      var snap =snapshot.data.docs;
      
      
      
      return     Column(children: [

      Stack(
        children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                      snap[0]['salonImage']
                  )),
            Container(color: Colors.black45,)
            ],
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10),
                Row(
                  children: [
                    Text( snap[0]['salonName'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600)),
                  ],
                ),

              ],
            ),
          ),
          Positioned(
            bottom: 15,
            right: 20,
            child: Row(
              children:  <Widget>[
                Icon(Icons.location_on_outlined,
                    size: 23, color: Colors.red),
                SizedBox(width: 2),
                Text( snap[0]['salonAddress'],
                    style: TextStyle(color: Colors.black, fontSize: 15))
              ],
            ),
          ),
        ],
      ),



      Column(
        children: [
          SizedBox(height: 20,),
const Text('All appointments',style: TextStyle(color: Colors.white),),


    StreamBuilder(
    stream: FirebaseFirestore.instance.collection('oppoinments').where('salonId',isEqualTo: CacheHelper.get(key: 'uid')).snapshots(),
    builder: (context, AsyncSnapshot snapshot) {
    if(  snapshot.connectionState == ConnectionState.waiting){
    return Center(
    child: CircularProgressIndicator.adaptive(
    backgroundColor: UIData.mainColor,
    ),
    );}else{
    var snap2 =snapshot.data.docs;

if(snap2==null){
  return const Center(child: Text('No appointments yet',style: TextStyle(color: Colors.white),),);
}else{

    return SizedBox(height: 500,child:     ListView.builder(itemBuilder: (context ,index)=>
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
                        backgroundImage: NetworkImage(
                            snap2[index]['specialistImage']
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children:  [
                          Text(
                            snap2[index]['name'],
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            '${snap2[index]['from']}:${snap2[index]['to']}',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children:  [
                          Text('Specialist name: ',style: TextStyle(color: UIData.mainColor,fontSize: 10),),
                          Text(snap2[index]['specialistName'],style: TextStyle(color: UIData.lightColor,fontSize: 10),),
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
            ))
      ,itemCount: snap2.length,
      ));
   }}}),


        ],
      ),



    ]);
    }})



        ),
      ),
    );
  }
}
