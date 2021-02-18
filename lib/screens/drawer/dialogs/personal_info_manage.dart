import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/screens/login_page/dialogs/phone_verification_dialog.dart';

import 'package:picknpay/screens/drawer/dialogs/change_password_dialog.dart';
import 'package:picknpay/widgets/dialog_title.dart';
import 'package:picknpay/widgets/buttons/white_dialog_button.dart';
import 'package:picknpay/widgets/size_boxes.dart';

personalInfoManageDialog() {
  return Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: KColors.black,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            dialogTitle("ID Information".tr),
            v20(),
            whiteDialogButton(
                title: "Update Your\nPhone Number".tr,
                onTap: () {
                  Get.back();
                  phoneVerificationDialog();
                }),
            v40(),
            whiteDialogButton(
                title: "Change Password".tr,
                onTap: () {
                  Get.back();
                  changePasswordDialog();
                }),
            v10(),
            Row(
              children: [
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
  );
}
