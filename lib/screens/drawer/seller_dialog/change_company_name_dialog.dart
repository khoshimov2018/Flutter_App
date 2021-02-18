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
              dialogTitle("Change Name".tr),
              v40(),
              Text(
                "Enter new name.".tr,
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
                              header: "Name Changed".tr,
                              title:
                                  "‘Pick N Go’ has been\nChanged to ‘*******’."
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
