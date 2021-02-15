import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';

Widget blackButton(
    {String title, Function onTap, FontWeight fontWeight, fontSize}) {
  return ZoomIn(
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: Offset(0, 3),
              blurRadius: 6)
        ],
        borderRadius: BorderRadius.circular(20),
        color: KColors.black,
      ),
      child: Material(
        elevation: 0,
        color: Colors.transparent,
        child: InkWell(
          splashFactory: InkRipple.splashFactory,
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            height: Get.height / 12.14,
            width: Get.width / 1.3,
            color: Colors.transparent,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize ?? 16,
                fontWeight: fontWeight ?? FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
