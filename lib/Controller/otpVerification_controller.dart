import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OTPVerificationController extends GetxController {
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

  TextEditingController otpController = TextEditingController();

  RxBool isProcessing = false.obs;
}
