import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:picknpay/constant/idpass.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/screens/login_page/dialogs/forgot_not_register_dialog.dart';
import 'package:picknpay/screens/login_page/dialogs/forgot_otp_dialog.dart';
import 'package:picknpay/style/text_styles.dart';
import 'package:picknpay/widgets/buttons/white_dialog_button.dart';
import 'package:picknpay/widgets/dialog_title.dart';
import 'package:picknpay/widgets/text_fields/kText_field.dart';
import 'package:picknpay/widgets/size_boxes.dart';

forgotMobileInputDialog() {
  TextEditingController mobileController = TextEditingController();

  return Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: KColors.black,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              dialogTitle("Forgot your Password".tr),
              v10(),
              Text(
                "Do you want to use mobile phone text authentication?".tr,
                style: plainWhite,
                textAlign: TextAlign.center,
              ),
              v10(),
              kTextField(
                  keyBoardType: TextInputType.number,
                  hintText: "phoneNumber".tr,
                  controller: mobileController),
              v10(),
              Row(
                children: [
                  Expanded(
                    child: whiteDialogButton(
                        title: "Certification".tr,
                        onTap: () {
                          Get.back();
                          if (mobileController.text == phone) {
                            forgotOtpDialog();
                          } else {
                            forgotNotRegisterDialog();
                          }
                        }),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: whiteDialogButton(
                        title: "Cancel".tr, onTap: () => Get.back()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
    transitionCurve: Curves.ease,
  );
}
