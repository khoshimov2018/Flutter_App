import 'package:picknpay/widgets/size_boxes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';

import 'package:picknpay/screens/drawer/seller_dialog/change_company_name_dialog.dart';
import 'package:picknpay/screens/drawer/seller_dialog/delete_company_dialog.dart';
import 'package:picknpay/widgets/buttons/white_dialog_button.dart';
import 'package:picknpay/widgets/dialog_title.dart';

companyManageDialog() {
  return Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: KColors.black,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            dialogTitle("Pick n Go Management".tr),
            v30(),
            whiteDialogButton(
                title: "Change of Company Name".tr,
                onTap: () {
                  Get.back();
                  changeCompanyNameDialog();
                }),
            v60(),
            whiteDialogButton(
                title: "Delete Business".tr,
                onTap: () {
                  Get.back();
                  deleteCompanyDialog();
                }),
            v20(),
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
