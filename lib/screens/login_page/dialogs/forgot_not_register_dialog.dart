import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/widgets/buttons/white_dialog_button.dart';
import 'package:picknpay/widgets/dialog_title.dart';
import 'package:picknpay/style/text_styles.dart';
import 'package:picknpay/widgets/size_boxes.dart';

forgotNotRegisterDialog() {
  return Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: KColors.black,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            dialogTitle("Forgot your Password".tr),
            v10(),
            Text(
              "This number is not registered.".tr,
              style: plainWhite,
              textAlign: TextAlign.center,
            ),
            v10(),
            Row(
              children: [
                Expanded(
                  child: whiteDialogButton(
                      title: "Confirm".tr, onTap: () => Get.back()),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
