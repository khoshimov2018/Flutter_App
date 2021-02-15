import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picknpay/style/text_styles.dart';

import 'package:animate_do/animate_do.dart';

Widget kTextField(
    {TextEditingController controller,
    String hintText,
    bool obscureText,
    onChanged,
    TextInputType keyBoardType}) {
  return ZoomIn(
    child: Container(
      alignment: Alignment.center,
      width: Get.width / 1.3,
      // height: Get.height / 12, //18.7
      // decoration: BoxDecoration(
      //     color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.bottom,
        validator: (value) {
          if (value.isEmpty) {
            return "Required";
          } else {
            return null;
          }
        },
        keyboardType: keyBoardType,
        onChanged: onChanged,
        controller: controller,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(Get.height / 74.8),
          isDense: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.transparent)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: Colors.orangeAccent,
              )),
          errorStyle: plainWhite,
          filled: true,
          disabledBorder: InputBorder.none,
          hintText: hintText,
          fillColor: Colors.white,
        ),
      ),
    ),
  );
}
