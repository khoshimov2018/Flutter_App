import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/style/text_styles.dart';
import 'package:picknpay/widgets/size_boxes.dart';
import 'package:picknpay/widgets/dialog_title.dart';
import 'package:picknpay/widgets/buttons/white_dialog_button.dart';

phoneDoesNotMatchDialog() {
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
              "Will you update to your\nnew phone number?".tr,
              style: plainWhite,
            ),
            v10(),
            Row(
              children: [
                Expanded(
                  child: whiteDialogButton(
                      title: "Update".tr,
                      onTap: () {
                        Get.back();
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
            )
          ],
        ),
      ),
    ),
  );
}
