import 'package:picknpay/widgets/size_boxes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/screens/login_page/dialogs/forgot_otp_dialog.dart';
import 'package:picknpay/screens/drawer/dialogs/default_dialog.dart';
import 'package:picknpay/screens/drawer/seller_dialog/account_new_change_dialog.dart';
import 'package:picknpay/screens/drawer/seller_dialog/add_business_dialog.dart';
import 'package:picknpay/screens/drawer/seller_dialog/comany_manage_dialog.dart';
import 'package:picknpay/widgets/buttons/white_dialog_button.dart';
import 'package:picknpay/widgets/dialog_title.dart';
import 'package:picknpay/widgets/text_fields/kText_field.dart';
import 'package:picknpay/widgets/buttons/white_dialog_button.dart';

businessManageDialog() {
  return Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: KColors.black,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            dialogTitle("Store Management".tr),
            v30(),
            whiteDialogButton(
                title: "Pick and go".tr,
                onTap: () {
                  companyManageDialog();
                }),
            v20(),
            whiteDialogButton(
                title: "Add Store".tr,
                onTap: () {
                  Get.back();
                  addBusinessDialog();
                }),
            v60(),
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
