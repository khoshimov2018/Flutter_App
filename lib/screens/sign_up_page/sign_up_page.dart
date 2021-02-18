import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/controller/buyer_sign_up_controller.dart';
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
  Widget build(BuildContext context) {
    List termControllers = [
      termController.t1,
      termController.t2,
      termController.t3,
      termController.t4,
      termController.t5
    ];
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
          v10(),
          Text(
            "Terms of service and conditions".tr,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          v30(),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 32),
                  child: InkWell(
                    splashFactory: InkRipple.splashFactory,
                    borderRadius: BorderRadius.circular(40),
                    splashColor: Colors.black.withOpacity(0.3),
                    onTap: () {
                      termControllers[index].toggle();
                    },
                    child: ZoomIn(
                      child: Row(
                        children: [
                          Obx(
                            () {
                              return SvgPicture.asset(
                                termControllers[index].value
                                    ? "assets/svg/check.svg"
                                    : "assets/svg/uncheck.svg",
                                height: 28,
                              );
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: 28,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                terms[index],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                          index == 1
                              ? InkWell(
                                  borderRadius: BorderRadius.circular(40),
                                  onTap: () {},
                                  child: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white,
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: terms.length,
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
                  if (termController.t1.value &&
                      termController.t2.value &&
                      termController.t3.value &&
                      termController.t4.value &&
                      termController.t5.value) {
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
                      color: termController.t1.value &&
                              termController.t2.value &&
                              termController.t3.value &&
                              termController.t4.value &&
                              termController.t5.value
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
    );
  }
}
