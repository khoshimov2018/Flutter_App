import 'package:animate_do/animate_do.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

Widget logo() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: Get.height / 15),
    child: Hero(tag: "logo", child: Image.asset("assets/svg/logo.png")),
  );
}
