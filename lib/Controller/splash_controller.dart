import 'package:car_rental_app_ui/Controller/onBoarding_screen_controller.dart';
import 'package:car_rental_app_ui/constants/widget_constant.dart';
import 'package:car_rental_app_ui/ui/onboarding_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onReady() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        navigationReplace(screen: OnBoardingScreen());
      },
    );
    // TODO: implement onReady
    super.onReady();
  }
}
