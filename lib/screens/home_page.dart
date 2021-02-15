import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/widgets/buttons/black_button.dart';

import 'package:picknpay/widgets/logo.dart';
import 'package:picknpay/widgets/size_boxes.dart';

import 'login_page/login_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.primaryColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logo(),
              v10(),
              blackButton(
                  title: "buyer".tr,
                  onTap: () {
                    box.write("buyer", true);
                    Get.to(LoginPage());
                  }),
              v10(),
              blackButton(
                title: "seller".tr,
                onTap: () {
                  box.write("buyer", false);
                  Get.to(LoginPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
