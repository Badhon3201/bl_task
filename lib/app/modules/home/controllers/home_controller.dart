import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/models/product_list_response_models.dart';
import '../repositories/product_repository.dart';

class HomeController extends GetxController {
  final productRepository = Get.find<ProductRepository>();
  final _productListResponse = Rxn<ProductListResponseModel>();

  final count = 0.obs;

  var searchController = TextEditingController();

  final _isLoading = false.obs;

  getProduct() async {
    _isLoading.value = true;
    final response = await productRepository.fetchProduct(searchController.text);
    _isLoading.value = false;

    response.fold((l) {
      Get.snackbar("Error", "An Error Occurred");
    }, (r) {
      _productListResponse.value = r;
    });
  }

  Rxn<ProductListResponseModel> get productListResponse => _productListResponse;

  RxBool get isLoading => _isLoading;

  @override
  void onInit() async {
    super.onInit();
    await getProduct();
  }
}
