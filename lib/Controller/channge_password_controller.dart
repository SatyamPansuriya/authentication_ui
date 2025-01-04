import 'package:car_rental_app_ui/constants/widget_constant.dart';
import 'package:car_rental_app_ui/ui/Authentication/congratulation_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
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

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxBool isProcessing = false.obs;
  RxBool isObsecureText = false.obs;
  RxBool isObsecureTextConfirmPassword = false.obs;

  onTapChnagePassword() {
    isProcessing.value = true;
    Future.delayed(
      const Duration(seconds: 2),
      () {
        navigation(screen: CongratulationScreen()).then((value) {
          isProcessing.value = false;
        });
      },
    );
  }
}
