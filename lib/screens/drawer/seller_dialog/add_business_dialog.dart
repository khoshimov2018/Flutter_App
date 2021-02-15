import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:picknpay/widgets/size_boxes.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/style/text_styles.dart';

import 'package:picknpay/screens/drawer/dialogs/default_dialog.dart';
import 'package:picknpay/widgets/buttons/white_dialog_button.dart';
import 'package:picknpay/widgets/dialog_title.dart';
import 'package:picknpay/widgets/text_fields/kText_field.dart';

addBusinessDialog() {
  TextEditingController acNumController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController compantRegController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();

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
              dialogTitle("Account Management".tr),
              v40(),
              Text(
                "Please register your business registration number and account"
                    .tr,
                style: plainWhite,
                textAlign: TextAlign.center,
              ),
              v40(),
              kTextField(
                  keyBoardType: TextInputType.number,
                  hintText: "Company Registration Number".tr,
                  controller: compantRegController),
              v60(),
              kTextField(
                  hintText: "Business Name".tr,
                  controller: businessNameController),
              v60(),
              kTextField(
                  hintText: "Name of Bank".tr, controller: bankNameController),
              v60(),
              kTextField(
                  keyBoardType: TextInputType.number,
                  hintText: "Account Number".tr,
                  controller: acNumController),
              v40(),
              Row(
                children: [
                  Expanded(
                    child: whiteDialogButton(
                        title: "Add".tr,
                        onTap: () {
                          Get.back();
                          defaultDialog(
                              header: "Business addition completed".tr,
                              title:
                                  "The company name’***’\nHas been registered"
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
                                  "Business certification failed\nplease try again"
                                      .tr,
                              header: "Add Business".tr);
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
