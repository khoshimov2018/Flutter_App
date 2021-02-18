import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picknpay/constant/idpass.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/screens/drawer/deleted.dart';
import 'package:picknpay/screens/drawer/dialogs/default_dialog.dart';
import 'package:picknpay/widgets/dialog_title.dart';
import 'package:picknpay/widgets/buttons/white_dialog_button.dart';
import 'package:picknpay/widgets/size_boxes.dart';
import 'package:picknpay/widgets/text_fields/kText_field.dart';
import 'package:picknpay/style/text_styles.dart';

deleteIdPassDialog() {
  TextEditingController currentPassController = TextEditingController();
  return Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: KColors.black,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            dialogTitle("Delete ID".tr),
            v20(),
            Text(
              "Enter your current password.".tr,
              style: plainWhite,
              textAlign: TextAlign.center,
            ),
            v20(),
            kTextField(
              hintText: "password".tr,
              controller: currentPassController,
            ),
            v20(),
            Row(
              children: [
                Expanded(
                  child: whiteDialogButton(
                      title: "Confirm".tr,
                      onTap: () {
                        if (currentPassController.text == pass) {
                          Get.back();
                          Get.to(Deleted());
                        } else {
                          defaultDialog(title: "Password do not Match".tr);
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
  );
}
