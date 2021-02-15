import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/style/text_styles.dart';

import 'buttons/white_dialog_button.dart';

onDeleteDialog() {
  return Get.dialog(
    Padding(
      padding: EdgeInsets.all(10),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: KColors.black,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Select number of Deletions".tr,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Ice Cream",
                style: plainWhite,
              ),
            ),
            Container(
              color: Colors.white,
              height: Get.height / 4,
              child: CupertinoPicker(
                onSelectedItemChanged: (int value) {},
                itemExtent: 50,
                children: List.generate(
                    30, (index) => Center(child: Text("${index + 1}"))),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: whiteDialogButton(
                      title: "Delete".tr,
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: whiteDialogButton(
                        title: "Cancel".tr, onTap: () => Get.back()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
