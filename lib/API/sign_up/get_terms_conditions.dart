import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:picknpay/constant/api_utils.dart';
import 'package:picknpay/controller/term_controller.dart';

getTermsConditions() async {
  TermController tC = Get.put(TermController());
  var response = await http.get(
      "${ApiUtils.baseUrl}/conditions/1");
  print(response.body);
  // List decodedData = jsonDecode(response.body);
  var decodedData = jsonDecode(response.body);
  tC.termsAndConditions.add({
        "title": decodedData["terms"],
        "value": false,
      });
  // decodedData.forEach((element) {
  //   tC.termsAndConditions.add({
  //     "title": element["terms"],
  //     "value": false,
  //   });
  // });
}
