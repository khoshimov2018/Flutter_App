import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:animate_do/animate_do.dart';

Widget whiteDialogButton({String title, Function onTap}) {
  return ZoomIn(
    duration: Duration(milliseconds: 200),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            height: Get.height / 15,
            child: Text(
              title,
              style: TextStyle(color: KColors.black),
            ),
          ),
        ),
      ),
    ),
  );
}
