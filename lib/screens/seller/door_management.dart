import 'package:picknpay/screens/drawer/kDrawer.dart';
import 'package:picknpay/screens/seller/register_nfc.dart';
import 'package:picknpay/screens/seller/store_qr_code.dart';
import 'package:picknpay/widgets/size_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/screens/seller/manage_stock.dart';
import 'package:picknpay/screens/seller/register_item.dart';
import 'package:picknpay/screens/seller/sales_management.dart';
import 'package:picknpay/screens/seller/seller_landing_page.dart';
import 'package:picknpay/screens/seller/stock_receipt.dart';
import 'package:picknpay/widgets/buttons/black_button.dart';
import 'package:picknpay/widgets/logo.dart';

class DoorManagement extends StatefulWidget {
  @override
  _DoorManagementState createState() => _DoorManagementState();
}

class _DoorManagementState extends State<DoorManagement> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: kDrawer(),
      key: _scaffoldKey,
      backgroundColor: KColors.primaryColor,
      body: Column(
        children: [
          v15(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: Text(
                    "Cancel".tr,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
                Spacer(),
                Text(
                  "Door".tr,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                Spacer(
                  flex: 2,
                )
              ],
            ),
          ),
          Spacer(),
          blackButton(
              title: "Register door lock NFC".tr,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              onTap: () {
                box.write("register", true);
                Get.to(RegisterNFC());
              }),
          v15(),
          blackButton(
              title: "Change door lock NFC".tr,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              onTap: () {
                box.write("register", false);
                Get.to(RegisterNFC());
              }),
          v15(),
          blackButton(
              title: "Store QR code".tr,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              onTap: () {
                Get.to(StoreQRCode());
              }),
          Spacer(),
        ],
      ),
    );
  }
}
