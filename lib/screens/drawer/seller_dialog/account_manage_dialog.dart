import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/style/text_styles.dart';
import 'package:picknpay/screens/drawer/seller_dialog/account_new_change_dialog.dart';
import 'package:picknpay/widgets/buttons/white_dialog_button.dart';
import 'package:picknpay/widgets/dialog_title.dart';
import 'package:picknpay/widgets/size_boxes.dart';

accountManagementDialog() {
  return Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: KColors.black,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            dialogTitle("Bank Account".tr),
            v30(),
            Text(
              "Choose a store to change account.".tr,
              style: plainWhite,
              textAlign: TextAlign.center,
            ),
            v30(),
            whiteDialogButton(
                title: "Pick and go".tr,
                onTap: () {
                  Get.back();
                  accountNewChangeDialog();
                }),
            v60(),
            Text(
              "Kookmin bank ****-**-******",
              style: plainWhite,
              textAlign: TextAlign.center,
            ),
            v30(),
            Row(
              children: [
                Expanded(
                  child: whiteDialogButton(
                      title: "Cancel".tr,
                      onTap: () {
                        Get.back();
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
