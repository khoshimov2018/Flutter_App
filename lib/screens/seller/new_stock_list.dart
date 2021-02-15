import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/screens/seller/business_home_page.dart';
import 'package:picknpay/screens/seller/dialogs/edit_item_dialogs.dart';
import 'package:picknpay/style/text_styles.dart';
import 'package:picknpay/widgets/seller_product_card.dart';
import 'package:picknpay/widgets/size_boxes.dart';

class NewStockList extends StatefulWidget {
  @override
  _NewStockListState createState() => _NewStockListState();
}

class _NewStockListState extends State<NewStockList> {
  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.primaryColor,
      body: Column(
        children: [
          v20(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: Text(
                    "Cancel".tr,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Spacer(),
                Text(
                  box.read("newStock") ? "New Stock".tr : "Stock Receipt".tr,
                  style: pageHeader,
                ),
                Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
          v40(),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(0, 6),
                    blurRadius: 10,
                  )
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 2),
                      alignment: Alignment.center,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.all(7),
                        itemBuilder: (BuildContext context, int index) {
                          return sellerProductCard(
                            price: "₩15,000",
                            imageUrl:
                                "https://www.incimages.com/uploaded_files/image/1920x1080/*Barcode_32896.jpg",
                            title: "082830100012 / Ice Cream",
                            pcs: "20",
                          );
                        },
                        itemCount: 10,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                    vertical: Get.height / 20, horizontal: 16),
                decoration: BoxDecoration(
                  color: KColors.black,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => Get.to(BusinessHomePage()),
                        child: ZoomIn(
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            alignment: Alignment.center,
                            height: Get.height / 15,
                            decoration: BoxDecoration(
                              color: KColors.primaryColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "Enrollment".tr,
                              style: plainWhite,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FadeInLeft(
                      child: Text(
                        "Number of products:".tr,
                        style: plainWhite,
                      ),
                    ),
                    FadeInRight(
                      child: Text(
                        "4 ${"Pcs".tr}",
                        style: plainWhite,
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

Widget myPopMenu() {
  return PopupMenuButton(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    color: KColors.black,
    onSelected: (value) {
      value == 2 ? editItemDialog() : null;
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
    ],
  );
}
