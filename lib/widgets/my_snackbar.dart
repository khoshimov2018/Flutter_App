import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';

mySnackBar({title, message}) {
  Get.snackbar(title, message,
      backgroundColor: KColors.black,
      colorText: KColors.primaryColor,
      borderRadius: 0,
      margin: EdgeInsets.all(0),
      snackPosition: SnackPosition.BOTTOM);
}
