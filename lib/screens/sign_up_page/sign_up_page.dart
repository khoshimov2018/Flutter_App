import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:picknpay/API/sign_up/get_terms_conditions.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/controller/term_controller.dart';
import 'package:picknpay/screens/sign_up_page/sign_up_mobile.dart';
import 'package:picknpay/style/text_styles.dart';
import 'package:picknpay/widgets/size_boxes.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  List terms = [
    "Agree to all terms of service and conditions".tr,
    "[required] Terms of Service".tr,
    "[required] Privacy Policy".tr,
    "[optional] Additional profile information".tr,
    "[optional] Receive promotional information".tr
  ];
  TermController termController = Get.put(TermController());

  @override
  void initState() {
    getTermsConditions();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: KColors.primaryColor,
      body: WillPopScope(
        // ignore: missing_return
        onWillPop: () {
          Get.back();
          termController.termsAndConditions.clear();
          termController.allTerms.value = false;
        },
        child: Column(
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
                      termController.termsAndConditions.clear();
                      termController.allTerms.value = false;

                      Get.back();
                    },
                    child: Text(
                      "Cancel".tr,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
            v10(),
            Text(
              "Terms of service and conditions".tr,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            v30(),
            Obx(() {
              return termController.termsAndConditions.length == 0
                  ? SizedBox()
                  : Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 32),
                      child: ZoomIn(
                        child: InkWell(
                          splashFactory: InkRipple.splashFactory,
                          borderRadius: BorderRadius.circular(40),
                          splashColor: Colors.black.withOpacity(0.3),
                          onTap: () {
                            termController.allTerms.value =
                                !termController.allTerms.value;
                            termController.termsAndConditions
                                .forEach((element) {
                              element["value"] = termController.allTerms.value;
                            });
                            setState(() {});
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                termController.allTerms.value
                                    ? "assets/svg/check.svg"
                                    : "assets/svg/uncheck.svg",
                                height: 28,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  height: 28,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Agree to all terms of service and conditions"
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
            }),
            Expanded(child: Obx(() {
              return termController.termsAndConditions.length == 0
                  ? Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(KColors.black),
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.all(0),
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 32),
                          child: InkWell(
                            splashFactory: InkRipple.splashFactory,
                            borderRadius: BorderRadius.circular(40),
                            splashColor: Colors.black.withOpacity(0.3),
                            onTap: () {
                              termController.termsAndConditions[index]
                                      ["value"] =
                                  !termController.termsAndConditions[index]
                                      ["value"];
                              if (termController.termsAndConditions
                                  .every((element) => element["value"])) {
                                termController.allTerms.value = true;
                              } else {
                                termController.allTerms.value = false;
                              }
                              setState(() {});
                            },
                            child: ZoomIn(
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    termController.termsAndConditions[index]
                                            ["value"]
                                        ? "assets/svg/check.svg"
                                        : "assets/svg/uncheck.svg",
                                    height: 28,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 28,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        termController.termsAndConditions[index]
                                            ["title"],
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: termController.termsAndConditions.length,
                    );
            })),
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
                    if (termController.termsAndConditions
                            .every((element) => element["value"]) &&
                        termController.termsAndConditions.length != 0) {
                      termController.termsAndConditions.clear();
                      termController.allTerms.value = false;
                      Get.to(SignUpMobile());
                    }
                  },
                  child: ZoomIn(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      alignment: Alignment.center,
                      height: Get.height / 15,
                      width: Get.width / 1.4,
                      decoration: BoxDecoration(
                        color: termController.termsAndConditions
                                    .every((element) => element["value"]) &&
                                termController.termsAndConditions.length != 0
                            ? KColors.primaryColor
                            : KColors.disColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.16),
                            offset: Offset(0, -3),
                            blurRadius: 6,
                          )
                        ],
                      ),
                      child: Text(
                        "Next".tr,
                        style: plainWhite,
                      ),
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
