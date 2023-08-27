import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return  Scaffold(
      body: Center(
        child: Text(
          'Battery Low Interactive Ltd',
          style: GoogleFonts.poppins(fontSize: 20),
        ),
      ),
    );
  }
}
