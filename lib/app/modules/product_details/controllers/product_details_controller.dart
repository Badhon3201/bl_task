import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/product_list_response_models.dart';

class ProductDetailsController extends GetxController
    with GetTickerProviderStateMixin {
  var argument = Get.arguments;
  final productDetails = Rxn<Hit>();

  final count = 0.obs;

  var initialTabIndex = 0.obs;

  late TabController tabController;

  @override
  void onInit() {
    super.onInit();

    productDetails.value = argument["itemDetails"];
    tabController = TabController(
        length: productDetails.value!.recipe!.digest!.length, vsync: this);
  }

  final tagsList = [
    "Low-Carb",
    "Dairy-Free",
    "Egg-Free",
    "Peanut-Free",
    "Tree-Nut-Free",
    "Soy-Free",
    "Fish-Free"
  ];
}
