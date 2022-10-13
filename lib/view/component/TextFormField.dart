import 'package:flutter/material.dart';
class TextFormWidget extends StatelessWidget {
final TextInputType textInputType ;
final bool  obscureText;
final Function validator;
final  TextEditingController controller;
  const TextFormWidget({super.key, required this.textInputType, required this.obscureText,required this.controller, required this.validator});
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 60,
      child: TextFormField(

        controller: controller,
        autofocus: false,
        validator: (val){
          validator(val);
        },
        textCapitalization: TextCapitalization.none,
        autocorrect: false,
        obscureText:obscureText ,
        enableSuggestions: false,

        keyboardType: textInputType,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
