import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/screens/login_page/dialogs/phone_changed_dialog.dart';
import 'package:picknpay/widgets/dialog_title.dart';
import 'package:picknpay/widgets/buttons/white_dialog_button.dart';
import 'package:picknpay/style/text_styles.dart';
import 'package:picknpay/widgets/size_boxes.dart';

phoneVerifiedDialog() {
  return Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: KColors.black,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            dialogTitle("Update Your\nPhone Number".tr),
            v10(),
            Text(
              "${"Your phone number has been verified.".tr}\n${"Will you update to".tr}\n010-xxxx-xxxx?",
              style: plainWhite,
              textAlign: TextAlign.center,
            ),
            v10(),
            Row(
              children: [
                Expanded(
                  child: whiteDialogButton(
                      title: "Update".tr,
                      onTap: () {
                        Get.back();
                        phoneChangedDialog(); //show
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
  );
}
