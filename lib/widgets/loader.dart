import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/controller/login_controller.dart';

Widget loader() {
  LoginController lC = Get.put(LoginController());

  return Stack(
    children: [
      Obx(() {
        return lC.loading.value
            ? BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.black.withOpacity(0.1),
                ),
              )
            : SizedBox();
      }),
      Obx(() {
        return lC.loading.value
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(KColors.black),
                ),
              )
            : SizedBox();
      })
    ],
  );
}
