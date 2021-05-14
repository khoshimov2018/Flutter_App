import 'dart:convert';
import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:picknpay/API/login_service.dart';
import 'package:picknpay/constant/idpass.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/controller/term_controller.dart';
import 'package:picknpay/screens/buyer/landing_page.dart';
import 'package:picknpay/screens/login_page/dialogs/new_number_change_dialog.dart';
import 'package:picknpay/screens/home_page.dart';
import 'package:picknpay/screens/seller/seller_landing_page.dart';
import 'package:picknpay/screens/sign_up_page/sign_up_page.dart';
import 'package:picknpay/style/text_styles.dart';
import 'package:picknpay/widgets/buttons/black_button.dart';
import 'package:picknpay/widgets/loader.dart';
import 'package:picknpay/widgets/logo.dart';
import 'package:picknpay/widgets/text_fields/kText_field.dart';
import 'package:picknpay/widgets/size_boxes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dialogs/forgot_mobile_input_dialog.dart';
import 'dialogs/phone_doesnotMatch_dialog.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TermController tC = Get.put(TermController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: KColors.primaryColor,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    v15(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {
                          Get.to(HomePage());
                        },
                        child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Icon(Icons.arrow_back_ios_rounded)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    logo(),
                    v10(),
                    kTextField(
                      keyBoardType: TextInputType.number,
                      hintText: "phoneNumber".tr,
                      controller: phoneNumberController,
                    ),
                    v60(),
                    kTextField(
                      hintText: "password".tr,
                      controller: passwordController,
                      obscureText: true,
                    ),
                    v60(),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: Offset(0, 3),
                              blurRadius: 6),
                        ],
                        color: KColors.black,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(40),
                          onTap: () async {
                            SharedPreferences pref =
                                await SharedPreferences.getInstance();
                            if (_formKey.currentState.validate()) {
                              GetStorage box = GetStorage();
                              if (box.read("buyer")) {
                                loginService(
                                        phoneNumber: phoneNumberController.text,
                                        password: passwordController.text,
                                        buyer: true)
                                    .then((value) => print(value));
                              } else {
                                loginService(
                                        phoneNumber: phoneNumberController.text,
                                        password: passwordController.text,
                                        buyer: false)
                                    .then((value) => print(value));
                              }
                            }
                            //   if (phoneNumberController.text == phone &&
                            //       passwordController.text == pass) {
                            //   } else {
                            //     loginFailedDialog(); //show
                            //   }
                            // } else {}
                          },
                          child: ZoomIn(
                            child: Container(
                              alignment: Alignment.center,
                              height: Get.height / 16,
                              width: Get.width / 1.3,
                              child: Text(
                                "login".tr,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    v60(),
                    InkWell(
                      onTap: () {
                        forgotMobileInputDialog();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "forgot your".tr,
                            style: plainWhite,
                          ),
                          Text(
                            " password?".tr,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    v60(),
                    InkWell(
                      onTap: () {
                        if (phoneNumberController.text == phone) {
                          newPhoneNumberChangeDialog(); //show
                        } else {
                          phoneDoesNotMatchDialog(); //show
                        }
                      },
                      child: Text(
                        "Update your phone number".tr,
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    v30(),
                    blackButton(
                        title: "sign up".tr,
                        onTap: () {
                          Get.to(SignUpPage());
                        }),
                  ],
                ),
              ),
            ),
            loader(),
          ],
        ));
  }
}
