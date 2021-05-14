import 'package:get/get.dart';

class TermController extends GetxController {
  RxList termsAndConditions = [].obs;
  RxBool allTerms = false.obs;

  RxString pass = "".obs;
  RxString conPass = "".obs;
}
