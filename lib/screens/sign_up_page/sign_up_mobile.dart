import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:picknpay/API/buyer/buyer_sign_up_service.dart';
import 'package:picknpay/constant/idpass.dart';
import 'package:picknpay/controller/seller_sign_up_controller.dart';
import 'package:picknpay/style/text_styles.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/controller/term_controller.dart';
import 'package:picknpay/screens/sign_up_page/dialogs/pass_dont_match.dart';
import 'package:picknpay/screens/seller/business_certification.dart';
import 'package:picknpay/widgets/my_snackbar.dart';
import 'package:picknpay/widgets/size_boxes.dart';
import 'package:picknpay/widgets/text_fields/kText_field.dart';

import 'card_registration.dart';

class SignUpMobile extends StatefulWidget {
  @override
  _SignUpMobileState createState() => _SignUpMobileState();
}

class _SignUpMobileState extends State<SignUpMobile> {
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  GetStorage box = GetStorage();
  SellerSignUPController sellerSignUPController = Get.put(SellerSignUPController());

  TermController termController = Get.put(TermController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            "Number verified!".tr,
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
            "Set your password".tr,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32,vertical: 16),
            child: kTextField(
                hintText: "phoneNumber".tr,
                controller: phoneNumber,
                onChanged: (value) {
                  termController.pass.value = value;
                }),
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
                hintText: "Re-enter Password".tr,
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
                      buyerSignUpService(
                        phoneNumber: phoneNumber.text,
                        password: passController.text
                      ).then((value) {
                        value?Get.to(CardRegistration()):mySnackBar(title: "Error",message: "Something went wrong");
                      });

                    } else {
                      passDontMatch(); //showing Dialog
                    }
                  } else {
                    if (termController.pass.value ==
                            termController.conPass.value &&
                        termController.pass.value != "") {
                      sellerSignUPController.phoneNumber.value = phoneNumber.text;
                      sellerSignUPController.password.value = passController.text;

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
                      "sign up".tr,
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
