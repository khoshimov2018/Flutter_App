import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:picknpay/style/text_styles.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/controller/buyer_sign_up_controller.dart';
import 'package:picknpay/screens/sign_up_page/dialogs/pass_dont_match.dart';
import 'package:picknpay/screens/seller/business_certification.dart';
import 'package:picknpay/widgets/size_boxes.dart';
import 'package:picknpay/widgets/text_fields/kText_field.dart';

import 'card_registration.dart';

class SignUpMobile extends StatefulWidget {
  @override
  _SignUpMobileState createState() => _SignUpMobileState();
}

class _SignUpMobileState extends State<SignUpMobile> {
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  GetStorage box = GetStorage();

  TermController termController = Get.put(TermController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: KColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          v15(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    "Cancel".tr,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Spacer(),
                Text(
                  "sign up".tr,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
          v20(),
          Text(
            "Mobile phone authentication\nCompleted!".tr,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Please Set Password".tr,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: kTextField(
                hintText: "password".tr,
                controller: passController,
                obscureText: true,
                onChanged: (value) {
                  termController.pass.value = value;
                }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: kTextField(
                hintText: "Confirm Password".tr,
                obscureText: true,
                controller: confirmPassController,
                onChanged: (value) {
                  termController.conPass.value = value;
                }),
          ),
          Spacer(),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: Get.height / 20),
            decoration: BoxDecoration(
              color: KColors.black,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.16),
                  offset: Offset(0, -3),
                  blurRadius: 6,
                )
              ],
            ),
            child: Obx(() {
              return InkWell(
                onTap: () {
                  if (box.read("buyer")) {
                    if (termController.pass.value ==
                            termController.conPass.value &&
                        termController.pass.value != "") {
                      Get.to(CardRegistration());
                    } else {
                      passDontMatch(); //showing Dialog
                    }
                  } else {
                    if (termController.pass.value ==
                            termController.conPass.value &&
                        termController.pass.value != "") {
                      Get.to(BusinessCertification());
                    } else {
                      passDontMatch(); //showing Dialog
                    }
                  }
                },
                child: ZoomIn(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    alignment: Alignment.center,
                    height: Get.height / 15,
                    width: Get.width / 1.4,
                    decoration: BoxDecoration(
                      color: termController.pass.value ==
                                  termController.conPass.value &&
                              termController.pass.value != ""
                          ? KColors.primaryColor
                          : KColors.disColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      "Join".tr,
                      style: plainWhite,
                    ),
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
