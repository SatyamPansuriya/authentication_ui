import 'package:car_rental_app_ui/constants/color_constant.dart';
import 'package:car_rental_app_ui/constants/message_string_const.dart';
import 'package:car_rental_app_ui/constants/widget_constant.dart';
import 'package:car_rental_app_ui/ui/Authentication/otp_verify_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    isPageProcessing.value = false;
    super.onClose();
  }

  final TextEditingController emailController = TextEditingController();

  RxBool isPageProcessing = false.obs;

  onTapSendCode() {
    isPageProcessing.value = true;
    showSnackbar(errorMessage: codeSentMessage, color: greenColor, title: codeSentSuccess);
    Future.delayed(
      const Duration(seconds: 2),
      () {
        navigation(screen: OTPVerificationScreen());
      },
    );
  }

  List<TextEditingController> controllers = List.generate(4, (index) => TextEditingController());

  Widget buildSingleOtpField(int index, context) {
    return SizedBox(
      width: 40,
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        onChanged: (value) {
          if (value.length == 1) {
            if (index < 3) {
              FocusScope.of(context).nextFocus();
            } else {
              FocusScope.of(context).unfocus();
            }
          }
        },
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        decoration: const InputDecoration(
          counterText: "",
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
        ),
      ),
    );
  }
}
