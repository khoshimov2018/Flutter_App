import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:picknpay/screens/sign_up_page/signed_up.dart';
import 'package:picknpay/widgets/size_boxes.dart';
import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/controller/seller_sign_up_controller.dart';
import 'package:picknpay/style/text_styles.dart';
import 'package:picknpay/screens/seller/regsitration_complete.dart';
import 'package:picknpay/widgets/text_fields/kText_field.dart';

class BusinessCertification extends StatefulWidget {
  @override
  _BusinessCertificationState createState() => _BusinessCertificationState();
}

class _BusinessCertificationState extends State<BusinessCertification> {
  TextEditingController companyReg = TextEditingController();
  TextEditingController businessName = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController acNum = TextEditingController();

  SellerSignUPController sell = Get.put(SellerSignUPController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: KColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          v15(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    "Cancel".tr,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Spacer(),
                Text(
                  "sign up".tr,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  v20(),
                  Text(
                    "Business Registration".tr,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Verify your business and bank account".tr,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: kTextField(
                        keyBoardType: TextInputType.number,
                        hintText: "Company Registration Number".tr,
                        controller: companyReg,
                        onChanged: (value) {
                          sell.companyRegNum.value = value;
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                    child: kTextField(
                        hintText: "Business Name".tr,
                        controller: businessName,
                        onChanged: (value) {
                          sell.businessName.value = value;
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 32,
                    ),
                    child: kTextField(
                        hintText: "Bank".tr,
                        controller: bankName,
                        onChanged: (value) {
                          sell.bankName.value = value;
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                    child: kTextField(
                        keyBoardType: TextInputType.number,
                        hintText: "Account Number".tr,
                        controller: acNum,
                        onChanged: (value) {
                          sell.acNum.value = value;
                        }),
                  ),
                  SizedBox(
                    height: Get.height / 3.5,
                  )
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: Get.height / 20),
            decoration: BoxDecoration(
              color: KColors.black,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.16),
                  offset: Offset(0, -3),
                  blurRadius: 6,
                )
              ],
            ),
            child: Obx(() {
              return InkWell(
                onTap: () {
                  if (sell.companyRegNum.isNotEmpty &&
                      sell.businessName.isNotEmpty &&
                      sell.bankName.isNotEmpty &&
                      sell.acNum.isNotEmpty) {
                    Get.to(SignedUp());
                  } else {}
                },
                child: ZoomIn(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    alignment: Alignment.center,
                    height: Get.height / 15,
                    width: Get.width / 1.4,
                    decoration: BoxDecoration(
                      color: sell.companyRegNum.isNotEmpty &&
                              sell.businessName.isNotEmpty &&
                              sell.bankName.isNotEmpty &&
                              sell.acNum.isNotEmpty
                          ? KColors.primaryColor
                          : KColors.disColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      "Register".tr,
                      style: plainWhite,
                    ),
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
