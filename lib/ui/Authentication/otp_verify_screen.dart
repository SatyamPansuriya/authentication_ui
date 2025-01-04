import 'package:car_rental_app_ui/Controller/otpVerification_controller.dart';
import 'package:car_rental_app_ui/constants/button_constant.dart';
import 'package:car_rental_app_ui/constants/color_constant.dart';
import 'package:car_rental_app_ui/constants/message_string_const.dart';
import 'package:car_rental_app_ui/constants/text_constant.dart';
import 'package:car_rental_app_ui/constants/widget_constant.dart';
import 'package:car_rental_app_ui/ui/Authentication/change_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OTPVerificationScreen extends StatelessWidget {
  OTPVerificationScreen({Key? key}) : super(key: key);

  OTPVerificationController otpVerificationController = Get.put(OTPVerificationController());

  @override
  Widget build(BuildContext context) {
    var controller = otpVerificationController;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          children: [
            heightBox(57.h),
            Align(
                alignment: Alignment.centerLeft,
                child: backButton(onTap: () {
                  Get.back();
                })),
            heightBox(50.h),
            textWidget(title: "Enter Verification Code", fw: FontWeight.bold, c: blackColor, fs: 24.sp),
            textWidget(
              title: "We have sent the code verification \nto your Email Address",
              fs: 14.sp,
              ta: TextAlign.center,
              c: lightBlack,
            ),
            heightBox(35),
            Pinput(
              controller: controller.otpController,
              length: 5,
              enabled: true,
              focusedPinTheme: PinTheme(
                width: 60.h,
                height: 70.h,
                textStyle: TextStyle(fontFamily: "PopinsRegular", fontSize: 18.sp, fontWeight: FontWeight.bold),
                decoration: BoxDecoration(
                  color: textFieldBorderColor,
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
              submittedPinTheme: PinTheme(
                width: 60.h,
                height: 70.h,
                textStyle: TextStyle(fontFamily: "PopinsRegular", fontSize: 18.sp, fontWeight: FontWeight.bold),
                decoration: BoxDecoration(
                  color: themeColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
              defaultPinTheme: PinTheme(
                width: 60.h,
                height: 70.h,
                textStyle: const TextStyle(fontFamily: "PopinsRegular"),
                decoration: BoxDecoration(
                  color: textFieldBorderColor,
                  // border: Border.all(color: lightBlack),
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
              onChanged: (value) {
                /* if (value.length == 6) {
                  controller.isButtonDisable.value = false;
                } else {
                  emailValidatorController.isButtonDisable.value = true;
                }*/
              },
              validator: (s) {
                // return s == '2222' ? null : 'Pin is incorrect';
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) {
                // emailValidatorController.isButtonDisable.value = false;
              },
            ),
            heightBox(35),
            Obx(() {
              controller.isProcessing.value;
              return progressButton(
                  isProcessing: controller.isProcessing.value,
                  onTap: () {
                    controller.isProcessing.value = true;
                    Future.delayed(
                      const Duration(seconds: 3),
                      () {
                        navigation(screen: ChangePasswordScreen()).then((value) {
                          controller.isProcessing.value = false;
                        });
                      },
                    );
                  },
                  title: "Verify");
            }),
            heightBox(35),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "Didn’t receive code?",
                  style: TextStyle(fontFamily: "PopinsRegular", fontSize: 16.sp, color: blackColor),
                  children: [
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () {
                          showSnackbar(errorMessage: codeSentMessage, color: greenColor, title: codeSentSuccess);
                          print(':: Resend Code Tapped ::');
                        },
                        child: Text(
                          ' Resend Code',
                          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "PopinsRegular", fontSize: 16.sp, color: themeColor),
                        ),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
