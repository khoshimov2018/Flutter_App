import 'package:picknpay/style/box_decorations.dart';
import 'package:picknpay/widgets/on_delete_dialog.dart';
import 'package:picknpay/widgets/purchase_card.dart';
import 'package:picknpay/widgets/size_boxes.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/screens/buyer/payment_provider.dart';
import 'package:picknpay/style/text_styles.dart';
import 'package:picknpay/widgets/buttons/white_dialog_button.dart';

class CheckCart extends StatefulWidget {
  @override
  _CheckCartState createState() => _CheckCartState();
}

class _CheckCartState extends State<CheckCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "Go Back".tr,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
                Spacer(),
                Text(
                  "Check Cart".tr,
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
              decoration: whiteConDec,
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 2),
                      alignment: Alignment.center,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.all(7),
                        itemBuilder: (BuildContext context, int index) {
                          return purchaseCard(
                            title: "Perfume",
                            imageUrl:
                                "https://lh3.googleusercontent.com/proxy/udEqYER0GUxTySSTS56TB1zUfv4xsxzB5ZPL3ZkzTCyvIGvoIZW3uWvxMc3vfnJYooHowkqqVLslqmEtlgqEByyJ6V_ZS2xLGba4JzT0w8uMhPNQ3d5OF0sg60mCYOE9MHWnldczs5U",
                            price: "₩1000",
                            onDelete: () {
                              onDeleteDialog();
                            },
                          );
                        },
                        itemCount: 20,
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
                      child: ZoomIn(
                        child: InkWell(
                          onTap: () => Get.to(PaymentProvider()),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            alignment: Alignment.center,
                            height: Get.height / 15,
                            decoration: BoxDecoration(
                              color: KColors.primaryColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "Payment".tr,
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
                        "Total:".tr,
                        style: plainWhite,
                      ),
                    ),
                    FadeInRight(
                      child: Text(
                        "₩8000",
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
