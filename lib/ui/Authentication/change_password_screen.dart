import 'package:car_rental_app_ui/Controller/channge_password_controller.dart';
import 'package:car_rental_app_ui/constants/button_constant.dart';
import 'package:car_rental_app_ui/constants/color_constant.dart';
import 'package:car_rental_app_ui/constants/message_string_const.dart';
import 'package:car_rental_app_ui/constants/text_constant.dart';
import 'package:car_rental_app_ui/constants/textform_field.dart';
import 'package:car_rental_app_ui/constants/widget_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);

  ChangePasswordController changePasswordController = Get.put(ChangePasswordController());
  @override
  Widget build(BuildContext context) {
    var controller = changePasswordController;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          children: [
            heightBox(57),
            Align(
                alignment: Alignment.centerLeft,
                child: backButton(onTap: () {
                  Get.back();
                })),
            heightBox(50),
            textWidget(
              title: "Change Password",
              fs: 24.sp,
              fw: FontWeight.bold,
              ta: TextAlign.center,
              c: blackColor,
            ),
            heightBox(12),
            textWidget(
              title: "The new Password must should contain\nminimum 8 character",
              fs: 14.sp,
              ta: TextAlign.center,
              c: lightBlack,
            ),
            heightBox(96),

            /// Password Text Field
            Obx(() {
              return textFormField(
                textEditingController: controller.passwordController,
                isObsecureText: controller.isObsecureText.value,
                hintText: password,
                suffixIcon: GestureDetector(
                  onTap: () {
                    controller.isObsecureText.value = !controller.isObsecureText.value;
                  },
                  child: SizedBox(
                    height: 25.h,
                    width: 25.w,
                    child: SvgPicture.asset(
                      controller.isObsecureText.value ? "assets/Icons/close_eye_password.svg" : "assets/Icons/open_eye_password.svg",
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null) {
                    print("Enter In If Condition Password");
                    return enterPassword;
                  }
                  print("Enter In Exit Condition");
                  return null;
                },
              );
            }),
            heightBox(18),

            /// Confirm password TextField
            Obx(() {
              return textFormField(
                textEditingController: controller.confirmPasswordController,
                isObsecureText: controller.isObsecureTextConfirmPassword.value,
                hintText: confirmPassword,
                suffixIcon: GestureDetector(
                  onTap: () {
                    controller.isObsecureTextConfirmPassword.value = !controller.isObsecureTextConfirmPassword.value;
                  },
                  child: SizedBox(
                    height: 25.h,
                    width: 25.w,
                    child: SvgPicture.asset(
                      controller.isObsecureTextConfirmPassword.value ? "assets/Icons/close_eye_password.svg" : "assets/Icons/open_eye_password.svg",
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null) {
                    print("Enter In If Condition Password");
                    return enterPassword;
                  }
                  if (value != controller.passwordController.text) {
                    return "Please Enter Same Passwords";
                  }
                  return null;
                },
              );
            }),
            heightBox(36),
            Obx(() {
              return progressButton(isProcessing: controller.isProcessing.value, onTap: controller.onTapChnagePassword, title: "Change Password");
            }),
          ],
        ),
      ),
    );
  }
}
