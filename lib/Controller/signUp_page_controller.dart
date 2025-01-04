import 'package:car_rental_app_ui/constants/color_constant.dart';
import 'package:car_rental_app_ui/constants/widget_constant.dart';
import 'package:car_rental_app_ui/ui/Authentication/login_screen.dart';
import 'package:car_rental_app_ui/ui/Authentication/signUp_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpPageController extends GetxController {
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

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxBool isPageProcessing = false.obs;
  RxBool isObsecureText = true.obs;
  RxBool isObsecureTextConfirmPassword = true.obs;

  bool checkCondition() {
    return true;
  }

  onTapSignUp() {
    isPageProcessing.value = true;
    if (checkCondition()) {}
  }

  onTapGoogleLogin() {
    isPageProcessing.value = false;
  }

  onTapAppleLogin() {
    showSnackbar(errorMessage: "Apple Login Not Work", color: pinkColor, title: "Oops...");
  }

  onTapLogin() {
    if (!isPageProcessing.value) {
      navigationReplace(screen: LoginPage());
    } else {
      showSnackbar(errorMessage: "Wait For Complete SignUp Process", color: pinkColor, title: "Waiting..");
    }
  }
}
