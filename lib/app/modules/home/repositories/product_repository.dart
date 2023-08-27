import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../core/utils/api_service/api_service.dart';
import '../../../core/utils/api_service/urls.dart';
import '../../../core/utils/failure/app_error.dart';
import '../../../data/models/product_list_response_models.dart';

class ProductRepository {
  Future<Either<AppError, ProductListResponseModel>> fetchProduct(
      String? keyword) async {
    try {
      var res = await ApiService().getRequest(
          "${Urls.productUrl}?type=public&co2EmissionsClass=A%2B&field%5B0%5D=uri&beta=true&random=true&cuisineType%5B0%5D=American&imageSize%5B0%5D=LARGE&mealType%5B0%5D=Breakfast&health%5B0%5D=alcohol-cocktail&diet%5B0%5D=balanced&dishType%5B0%5D=Biscuits%20and%20cookies&q=$keyword");
      debugPrint(res.statusCode.toString());
      if (res.statusCode == 200) {
        var decodedJson = json.decode(utf8.decode(res.bodyBytes));
        var productModel = ProductListResponseModel.fromJson(decodedJson);
        return Right(productModel);
      } else {
        return const Left(AppError.httpError);
      }
    } on SocketException catch (e) {
      debugPrint(e.toString());
      return const Left(AppError.networkError);
    } catch (e) {
      debugPrint(e.toString());
      return const Left(AppError.unknownError);
    }
  }
}
