import 'package:car_rental_app_ui/constants/color_constant.dart';
import 'package:car_rental_app_ui/constants/widget_constant.dart';
import 'package:car_rental_app_ui/ui/Authentication/forgetPassword_screen.dart';
import 'package:car_rental_app_ui/ui/Authentication/signUp_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
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

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isPageProcessing = false.obs;
  RxBool isObsecureText = true.obs;

  bool checkCondition() {
    return true;
  }

  onTapLogin() {
    isPageProcessing.value = true;
    if (checkCondition()) {}
  }

  onTapGoogleLogin() {
    isPageProcessing.value = false;
  }

  onTapAppleLogin() {
    showSnackbar(errorMessage: "Apple Login ", color: pinkColor, title: "Oops...");
  }

  onTapSignUp() {
    navigationReplace(screen: SignUpPage());
  }

  forgotPasswordOnTap() {
    navigation(screen: ForgetPasswordScreen());
  }
}
