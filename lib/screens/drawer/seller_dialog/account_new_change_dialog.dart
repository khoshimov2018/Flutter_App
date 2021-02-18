import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:picknpay/widgets/size_boxes.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/style/text_styles.dart';
import 'package:picknpay/screens/drawer/dialogs/default_dialog.dart';
import 'package:picknpay/widgets/buttons/white_dialog_button.dart';
import 'package:picknpay/widgets/dialog_title.dart';
import 'package:picknpay/widgets/text_fields/kText_field.dart';

accountNewChangeDialog() {
  TextEditingController acNumController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();

  return Get.dialog(
    Dialog(
      // insetPadding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: KColors.black,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              dialogTitle("Bank Account".tr),
              v40(),
              Text(
                "Enter new bank account.".tr,
                style: plainWhite,
                textAlign: TextAlign.center,
              ),
              v40(),
              kTextField(hintText: "Bank".tr, controller: bankNameController),
              v60(),
              kTextField(
                  keyBoardType: TextInputType.number,
                  hintText: "Account Number".tr,
                  controller: bankNameController),
              v40(),
              Row(
                children: [
                  Expanded(
                    child: whiteDialogButton(
                        title: "Change".tr,
                        onTap: () {
                          Get.back();
                          defaultDialog(
                              header: "Bank Account".tr,
                              title:
                                  "The account with the trade name “Pick and Go”\nHas been changed."
                                      .tr);
                        }),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: whiteDialogButton(
                        title: "Cancel".tr,
                        onTap: () {
                          defaultDialog(
                              title:
                                  "Account information does not match\nPlease press again"
                                      .tr,
                              header: "Account Management".tr);
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
