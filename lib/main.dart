import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/core/utils/reponsive_ui_service.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "BLTask",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
