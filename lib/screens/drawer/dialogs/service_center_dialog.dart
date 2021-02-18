import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/style/text_styles.dart';
import 'package:picknpay/screens/drawer/dialogs/default_dialog.dart';
import 'package:picknpay/widgets/dialog_title.dart';
import 'package:picknpay/widgets/buttons/white_dialog_button.dart';
import 'package:picknpay/widgets/size_boxes.dart';
import 'package:picknpay/widgets/text_fields/kText_field.dart';

serviceCenterDialog() {
  return Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: KColors.black,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            dialogTitle("Service Center".tr),
            v40(),
            kTextField(
              hintText: "Enter My Email".tr,
            ),
            v40(),
            Expanded(
              child: TextFormField(
                // validator: (value) {
                //   if (value.isEmpty) {
                //     return "Required";
                //   } else {
                //     return null;
                //   }
                // },
                maxLines: 18,
                decoration: InputDecoration(
                  errorStyle: plainWhite,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  hintText: "What is your inquiry?".tr,
                  fillColor: Colors.white,
                ),
              ),
            ),
            v40(),
            Row(
              children: [
                Expanded(
                  child: whiteDialogButton(
                      title: "Send".tr,
                      onTap: () {
                        Get.back();
                        defaultDialog(
                            title: "You have sent your inquiry.".tr,
                            header: "Service center".tr);
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
