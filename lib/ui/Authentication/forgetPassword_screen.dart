import 'package:car_rental_app_ui/Controller/forgotPassword_controller.dart';
import 'package:car_rental_app_ui/constants/button_constant.dart';
import 'package:car_rental_app_ui/constants/color_constant.dart';
import 'package:car_rental_app_ui/constants/message_string_const.dart';
import 'package:car_rental_app_ui/constants/text_constant.dart';
import 'package:car_rental_app_ui/constants/textform_field.dart';
import 'package:car_rental_app_ui/constants/widget_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  final ForgotPasswordController forgotPasswordController = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    var controller = forgotPasswordController;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            heightBox(57.h),
            Align(
                alignment: Alignment.centerLeft,
                child: backButton(onTap: () {
                  Get.back();
                })),
            heightBox(50),
            textWidget(
              title: "Forgot Password",
              fs: 24.sp,
              fw: FontWeight.bold,
              ta: TextAlign.center,
              c: blackColor,
            ),
            heightBox(12),
            textWidget(
              title: "Please enter your email address. So we’ll send \nyou link to get back into your account.",
              fs: 14,
              ta: TextAlign.center,
              c: lightBlack,
            ),
            heightBox(35),

            /// Email Text Field
            textFormField(
              textEditingController: controller.emailController,
              isObsecureText: false,
              hintText: emailAddress,
              validator: (value) {
                String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                RegExp regex = RegExp(pattern);
                if (value == null) {
                  print("Enter In If Condition");
                  return enterEmail;
                }
                if (!regex.hasMatch(value)) {
                  print("Enter In Else Condition");
                  return enterValidEmail;
                }
                print("Enter In Exit Condition");
                return null;
              },
            ),
            heightBox(35),
            heightBox(35),
            Obx(() {
              return progressButton(
                isProcessing: controller.isPageProcessing.value,
                title: sendCode,
                onTap: () {
                  controller.onTapSendCode();
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
