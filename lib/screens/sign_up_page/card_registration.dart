import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/controller/buyer_sign_up_controller.dart';
import 'package:picknpay/style/text_styles.dart';
import 'package:picknpay/screens/home_page.dart';
import 'package:picknpay/widgets/size_boxes.dart';

class CardRegistration extends StatefulWidget {
  @override
  _CardRegistrationState createState() => _CardRegistrationState();
}

class _CardRegistrationState extends State<CardRegistration> {
  TermController termController = Get.put(TermController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: KColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          v20(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Card Registration".tr,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
          v10(),
          Text(
            "Congratulations on Signing up!".tr,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Please register the credit card to be used".tr,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              color: Colors.white,
              child: Text(
                  "This page will change Depending on the Payment system provider"
                      .tr),
            ),
          ),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: Get.height / 40),
              decoration: BoxDecoration(
                color: KColors.black,
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.offAll(HomePage());
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      alignment: Alignment.center,
                      height: Get.height / 15,
                      width: Get.width / 1.4,
                      decoration: BoxDecoration(
                        color: KColors.primaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        "Enrollment".tr,
                        style: plainWhite,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      alignment: Alignment.center,
                      height: Get.height / 15,
                      width: Get.width / 1.4,
                      decoration: BoxDecoration(
                        color: KColors.black,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        "Next".tr,
                        style: plainWhite,
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
