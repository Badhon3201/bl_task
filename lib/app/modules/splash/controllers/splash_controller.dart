import 'package:bl_task/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  @override
  void onInit() {
    super.onInit();
    splashNavigator();
  }

  splashNavigator(){
    Future.delayed(const Duration(seconds: 2),(){
      Get.offAndToNamed(Routes.HOME);
    });
  }

}
