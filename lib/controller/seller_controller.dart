import 'package:get/get.dart';
import 'package:picknpay/models/store_model.dart';

class SellerController {
  Rx<StoreModel> storeModel = StoreModel().obs;
}