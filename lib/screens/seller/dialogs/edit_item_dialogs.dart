import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/style/text_styles.dart';
import 'package:picknpay/widgets/size_boxes.dart';

import 'package:picknpay/widgets/buttons/white_dialog_button.dart';
import 'package:picknpay/widgets/text_fields/kText_field.dart';

editItemDialog() {
  return Get.dialog(
    Dialog(
      // insetPadding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: KColors.black,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: Get.height / 8,
                    width: Get.height / 8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Text(
                    "Add Photo".tr,
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline),
                  )
                ],
              ),
              v60(),
              Row(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    width: Get.width / 4,
                    child: Text(
                      "Name".tr,
                      style: plainWhite,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(child: kTextField(hintText: "Product Name".tr))
                ],
              ),
              v40(),
              Row(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    width: Get.width / 4,
                    child: Text(
                      "Category".tr,
                      style: plainWhite,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(child: kTextField(hintText: "Category Name".tr))
                ],
              ),
              v40(),
              Row(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    width: Get.width / 4,
                    child: Text(
                      "Price".tr,
                      style: plainWhite,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(child: kTextField(hintText: "Price".tr))
                ],
              ),
              v40(),
              Row(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    width: Get.width / 4,
                    child: Text(
                      "Warehousing".tr,
                      style: plainWhite,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(child: kTextField(hintText: "Warehousing".tr))
                ],
              ),
              v40(),
              Row(
                children: [
                  Expanded(
                    child: whiteDialogButton(
                        title: "Confirm".tr,
                        onTap: () {
                          Get.back();
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
    ),
  );
}
