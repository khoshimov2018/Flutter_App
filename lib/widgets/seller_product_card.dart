import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/screens/seller/dialogs/edit_item_dialogs.dart';
import 'package:picknpay/widgets/on_delete_dialog.dart';

Widget sellerProductCard(
    {String title, String price, String imageUrl, String pcs}) {
  return ZoomIn(
    child: Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            offset: Offset(0, 3),
            blurRadius: 2,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElasticInLeft(
            child: Container(
              height: Get.height / 10,
              width: Get.height / 10,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  image: DecorationImage(
                      image: NetworkImage(imageUrl), fit: BoxFit.cover)),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            height: Get.height / 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElasticInDown(child: Text(title)),
                ElasticIn(child: Text(price)),
                ElasticInUp(child: Text("$pcs ${"Pcs".tr}")),
              ],
            ),
          ),
          Spacer(),
          ElasticInRight(
            child: Container(
              height: Get.height / 10,
              alignment: Alignment.center,
              child: myPopMenu(),
            ),
          )
        ],
      ),
    ),
  );
}

Widget myPopMenu() {
  return PopupMenuButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: KColors.black,
      onSelected: (value) {
        value == 2 ? editItemDialog() : onDeleteDialog();
      },
      itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                height: Get.height / 15,
                padding: EdgeInsets.symmetric(horizontal: Get.width / 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text('Delete'.tr),
              ),
            ),
            PopupMenuItem(
              value: 2,
              child: Container(
                margin: EdgeInsets.only(top: 16, bottom: 10),
                height: Get.height / 15,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text('Edit'.tr),
              ),
            ),
          ]);
}
