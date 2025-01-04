import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashTwoController extends GetxController with GetTickerProviderStateMixin {
  @override
  void onInit() {
    animationControllers = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    animations = Tween<double>(begin: -150, end: 0).animate(CurvedAnimation(parent: animationControllers, curve: Curves.easeInOut));
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
    isChange.value = true;
    animationControllers.forward();
    // TODO: implement onReady
    super.onReady();
  }

  RxBool isChange = false.obs;
  late AnimationController animationControllers;
  late Animation animations;
}
