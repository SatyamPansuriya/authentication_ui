import 'package:car_rental_app_ui/constants/widget_constant.dart';
import 'package:car_rental_app_ui/ui/location_activate_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreenController extends GetxController {
  final controller = PageController(keepPage: true);
  final controller2 = PageController(keepPage: true);
  RxInt currrentPage = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  onNextTap() {
    if (currrentPage.value < 2) {
      currrentPage.value += 1;
      controller.animateToPage(currrentPage.value, duration: const Duration(milliseconds: 1000), curve: Curves.easeInOut);
      controller2.animateToPage(currrentPage.value, duration: const Duration(milliseconds: 1200), curve: Curves.easeInOut);
    } else {
      navigationReplace(screen: const LocationActivate());
    }
  }
}
