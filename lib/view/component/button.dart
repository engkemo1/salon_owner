import 'package:flutter/material.dart';

import '../../uidata.dart';


class MyButton extends StatelessWidget {
  final String btnText;
  final VoidCallback onpressed;

  const MyButton({ required this.btnText, required this.onpressed}) ;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: UIData.mainColor,borderRadius: BorderRadius.circular(25)),
      width: MediaQuery.of(context).size.width * .4,
      height: 40,
      child: TextButton(

        onPressed: onpressed,
        child: Text(btnText, style: TextStyle(color: UIData.darkColor,
        fontSize: 15.5,
        fontWeight: FontWeight.w400)),
      ),
    );
  }

}