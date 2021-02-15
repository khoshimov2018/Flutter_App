import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/screens/login_page/dialogs/phone_verification_dialog.dart';

import 'package:picknpay/screens/drawer/dialogs/default_dialog.dart';
import 'package:picknpay/widgets/dialog_title.dart';
import 'package:picknpay/widgets/buttons/white_dialog_button.dart';
import 'package:picknpay/widgets/text_fields/kText_field.dart';
import 'package:picknpay/widgets/size_boxes.dart';

newPasswordDialog() {
  TextEditingController newPassController = TextEditingController();
  TextEditingController conPassController = TextEditingController();

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
              dialogTitle("Change Password".tr),
              v10(),
              kTextField(
                controller: newPassController,
                hintText: "New Password".tr,
              ),
              v40(),
              kTextField(
                controller: conPassController,
                hintText: "Re-Enter Password".tr,
              ),
              v10(),
              Row(
                children: [
                  Expanded(
                    child: whiteDialogButton(
                      title: "Change".tr,
                      onTap: () {
                        if (newPassController.text == conPassController.text &&
                            newPassController.text.isNotEmpty) {
                          Get.back();
                          defaultDialog(
                              title: "Your Password has been Changed".tr);
                        } else {
                          defaultDialog(title: "Password do not match".tr);
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: whiteDialogButton(
                        title: "Cancel".tr, onTap: () => Get.back()),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
