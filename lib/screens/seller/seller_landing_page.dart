import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:picknpay/API/seller/get_store_service.dart';
import 'package:picknpay/constant/kColors.dart';
import 'package:picknpay/controller/login_controller.dart';
import 'package:picknpay/controller/seller_controller.dart';
import 'package:picknpay/models/store_model.dart';
import 'package:picknpay/screens/drawer/kDrawer.dart';
import 'package:picknpay/style/text_styles.dart';
import 'package:picknpay/widgets/size_boxes.dart';
import 'package:picknpay/screens/login_page/login_page.dart';
import 'package:picknpay/screens/seller/business_home_page.dart';
import 'package:picknpay/widgets/buttons/black_button.dart';
import 'package:picknpay/widgets/logo.dart';

class SellerLandingPage extends StatefulWidget {
  @override
  _SellerLandingPageState createState() => _SellerLandingPageState();
}

class _SellerLandingPageState extends State<SellerLandingPage> {
  SellerController sellerController = Get.put(SellerController());
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  LoginController lC = Get.put(LoginController());

  @override
  void initState() {
    getStoreService();
    // TODO: implement initState
    super.initState();
  }

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
                    Get.to(LoginPage());
                  },
                  child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Icon(Icons.arrow_back_ios_rounded)),
                ),
                InkWell(
                    onTap: () {
                      _scaffoldKey.currentState.openEndDrawer();
                    },
                    child: Icon(
                      Icons.settings,
                      color: KColors.black,
                    ))
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
          Text(
            "Choose a store to manage".tr,
            style: plainWhite,
          ),
          v20(),
      Obx((){
        return    Expanded(
          child:  sellerController.storeModel.value.store==null?Center(child: Lottie.asset("assets/svg/loading.json"),): sellerController.storeModel.value.store.length==0?Center(child: Text("No store is available"),):ListView.builder(padding: EdgeInsets.zero,itemBuilder:(ctx,index){
            return  Padding(
              padding:  EdgeInsets.only(left: 16,right: 16,bottom: 10),
              child: blackButton(
                  title: sellerController.storeModel.value.store[index].name,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  onTap: () {
                    Get.offAll(BusinessHomePage());
                  }),
            );
          },itemCount: sellerController.storeModel.value.store.length,),);
      })
        ],
      ),
    );
  }
}
