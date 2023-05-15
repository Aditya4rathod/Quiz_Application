import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';

class Utils {
  static void fieldFocusChange(BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message){
    Fluttertoast.showToast(msg: message,
      backgroundColor: kRedColor,
      gravity: ToastGravity.BOTTOM,
    );
  }

  static snackBar(String title , String message){
    Get.snackbar(title, message,
        backgroundColor: kBlackColor,
        colorText: kRedColor);
  }
}
