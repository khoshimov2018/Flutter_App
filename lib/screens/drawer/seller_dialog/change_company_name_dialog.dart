import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/screens/drawer/dialogs/default_dialog.dart';
import 'package:picknpay/widgets/buttons/white_dialog_button.dart';
import 'package:picknpay/widgets/dialog_title.dart';
import 'package:picknpay/widgets/size_boxes.dart';
import 'package:picknpay/widgets/text_fields/kText_field.dart';
import 'package:picknpay/style/text_styles.dart';

changeCompanyNameDialog() {
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
              dialogTitle("Change of Company Name".tr),
              v40(),
              Text(
                "Please register your business registration number and account"
                    .tr,
                style: plainWhite,
                textAlign: TextAlign.center,
              ),
              v20(),
              kTextField(
                  hintText: "Business Name".tr,
                  controller: businessNameController),
              v20(),
              Row(
                children: [
                  Expanded(
                    child: whiteDialogButton(
                        title: "Change".tr,
                        onTap: () {
                          Get.back();
                          defaultDialog(
                              header: "Company name changed".tr,
                              title:
                                  "Company name “Pick and Go”\nHas been changed to’***’"
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
                          Get.back();
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
