import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(String mymsg, [Color? customBackgroundColor]) {
  customBackgroundColor ??=
      AppColors.primaryColor; // تعيين القيمة الافتراضية إذا كانت null

  Fluttertoast.showToast(
      msg: mymsg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: customBackgroundColor,
      textColor: AppColors.offWhite,
      fontSize: 16.0);
}
