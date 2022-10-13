import 'package:flutter/material.dart';

import '../../component/button.dart';
import 'authentication.dart';
class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                      image: AssetImage(
                        "images/logo2.jpeg",
                      ),
                      fit: BoxFit.contain)),
              height: MediaQuery.of(context).size.height * .45,
            ),
       const     Text("Book your \nFavourite Salon",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                    fontSize: 22,
                    letterSpacing: 1.3,
                    color: Colors.white)),
       const     Text(
              "Lorem Ipsum is simply a dummy text of the printing and typesetting industry",
              textAlign: TextAlign.center,
              style: TextStyle(
                  height: 1.8, letterSpacing: 1.3, color: Colors.white),
            ),
            MyButton(
                btnText: "Start",
                onpressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>  AuthenticationPage(
                            )))),

          ],
        ),
      ),
    );
  }
}
