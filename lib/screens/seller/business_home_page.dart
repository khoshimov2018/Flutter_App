import 'package:picknpay/screens/drawer/kDrawer.dart';
import 'package:picknpay/screens/seller/door_management.dart';
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
                      child: Icon(Icons.arrow_back_ios_rounded)),
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
          v60(),
          blackButton(
              title: "Register Item".tr,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              onTap: () {
                box.write("newStock", true);

                Get.to(RegisterItem());
              }),
          v30(),
          blackButton(
              title: "Restocking".tr,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              onTap: () {
                box.write("newStock", false);
                Get.to(RegisterItem());
              }),
          v30(),
          blackButton(
              title: "Manage Stock".tr,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              onTap: () {
                Get.to(ManageStock());
              }),
          v30(),
          blackButton(
              title: "Sales Management".tr,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              onTap: () {
                Get.to(SalesManagement());
              }),
          v30(),
          blackButton(
              title: "Door Management".tr,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              onTap: () {
                Get.to(DoorManagement());
              }),
        ],
      ),
    );
  }
}
