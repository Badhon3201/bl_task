import 'package:bl_task/app/modules/home/repositories/product_repository.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() {
  Get.lazyPut(() => ProductRepository(), fenix: true);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BLTask",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
