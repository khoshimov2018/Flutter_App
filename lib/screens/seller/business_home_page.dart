import 'package:picknpay/screens/drawer/kDrawer.dart';
import 'package:picknpay/widgets/size_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/screens/seller/inventory_management.dart';
import 'package:picknpay/screens/seller/new_stock.dart';
import 'package:picknpay/screens/seller/sales_management.dart';
import 'package:picknpay/screens/seller/seller_landing_page.dart';
import 'package:picknpay/screens/seller/stock_receipt.dart';
import 'package:picknpay/widgets/buttons/black_button.dart';
import 'package:picknpay/widgets/logo.dart';

class BusinessHomePage extends StatefulWidget {
  @override
  _BusinessHomePageState createState() => _BusinessHomePageState();
}

class _BusinessHomePageState extends State<BusinessHomePage> {
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.off(SellerLandingPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Go Back".tr,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          logo(),
          Hero(
            tag: "seller",
            child: Material(
              color: Colors.transparent,
              child: Text(
                "SELLER".tr,
                style: TextStyle(color: Colors.white, fontSize: 40, shadows: [
                  Shadow(color: Colors.black, offset: Offset(4, 4))
                ]),
              ),
            ),
          ),
          v20(),
          blackButton(
              title: "New Stock".tr,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              onTap: () {
                box.write("newStock", true);

                Get.to(NewStock());
              }),
          v30(),
          blackButton(
              title: "Stock Receipt".tr,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              onTap: () {
                box.write("newStock", false);
                Get.to(StockReceipt());
              }),
          v30(),
          blackButton(
              title: "Inventory Management".tr,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              onTap: () {
                Get.to(InventoryManage());
              }),
          v30(),
          blackButton(
              title: "Sales Management".tr,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              onTap: () {
                Get.to(SalesManagement());
              }),
        ],
      ),
    );
  }
}
