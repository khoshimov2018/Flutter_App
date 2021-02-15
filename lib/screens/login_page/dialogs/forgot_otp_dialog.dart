import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:picknpay/constant/idpass.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/screens/login_page/dialogs/forgot_show_pwd.dart';
import 'package:picknpay/screens/login_page/dialogs/forgot_wrong_otp_dialog.dart';
import 'package:picknpay/widgets/buttons/white_dialog_button.dart';
import 'package:picknpay/widgets/dialog_title.dart';
import 'package:picknpay/widgets/text_fields/kText_field.dart';
import 'package:picknpay/style/text_styles.dart';
import 'package:picknpay/widgets/size_boxes.dart';

forgotOtpDialog() {
  TextEditingController otpController = TextEditingController();

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
              kTextField(
                  keyBoardType: TextInputType.number,
                  hintText: "Certification Number".tr,
                  controller: otpController),
              v10(),
              Text(
                "The authentication number sent by text message Please enter"
                    .tr,
                style: plainWhite,
                textAlign: TextAlign.center,
              ),
              v10(),
              Row(
                children: [
                  Expanded(
                    child: whiteDialogButton(
                        title: "Next".tr,
                        onTap: () {
                          Get.back();
                          if (otpController.text == pass) {
                            forgotShowPwd();
                          } else {
                            forgotWrongOtpDialog();
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
              SizedBox(
                height: Get.height / 8,
              ),
              Text(
                "Didn't you get your ID Number ?".tr,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              v10(),
              whiteDialogButton(title: "Re-Send".tr),
            ],
          ),
        ),
      ),
    ),
  );
}
