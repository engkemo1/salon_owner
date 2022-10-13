import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';

void showAlert(String message) {
  Fluttertoast.showToast(msg: message);
}

String generateId() {
  return const Uuid().v1();
}

String? validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value))
    return 'Enter a valid email address';
  else
    return null;
}

String? validate(String value) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  return null;

}
String? validatePassword(String value) {
  RegExp regex =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (value.isEmpty) {
    return 'Please enter password';
  } else {
    if (!regex.hasMatch(value)) {
      return 'Enter valid password';
    } else {
      return null;
    }
  }



    }

String? validateConfirmPassword(String value,String password) {
  RegExp regex =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (value.isEmpty) {
    return 'Please enter password';
  } else {
    if (!regex.hasMatch(value)) {
      return 'Enter valid password';
    } else if(value!=password){
      return 'Enter valid password';
    }else {
    return null;
    }
  }



}
