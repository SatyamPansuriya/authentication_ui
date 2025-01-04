import 'package:car_rental_app_ui/Controller/signUp_page_controller.dart';
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

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final SignUpPageController signUpPageController = Get.put(SignUpPageController());

  @override
  Widget build(BuildContext context) {
    var controller = signUpPageController;
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                heightBox(36),
                textWidget(title: logo, fs: 50, fw: FontWeight.bold, ta: TextAlign.center, c: blackColor),
                heightBox(15),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: signUpTo,
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: rentro,
                        style: TextStyle(
                          color: themeColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                heightBox(10),

                textWidget(title: signUpPageDescription, fs: 14, fw: FontWeight.bold, ta: TextAlign.center, c: lightBlack),

                heightBox(26),

                /// Name Text Field
                textFormField(
                  textEditingController: controller.nameController,
                  isObsecureText: false,
                  hintText: name,
                  validator: (value) {
                    if (value == null) {
                      print("Enter In If Condition");
                      return enterName;
                    }
                    print("Enter In Exit Condition");
                    return null;
                  },
                ),
                heightBox(18),

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
                heightBox(18),

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
                          controller.isObsecureTextConfirmPassword.value
                              ? "assets/Icons/close_eye_password.svg"
                              : "assets/Icons/open_eye_password.svg",
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

                heightBox(35),
                Obx(() {
                  return progressButton(
                    isProcessing: controller.isPageProcessing.value,
                    title: signup,
                    onTap: () {
                      controller.onTapSignUp();
                    },
                  );
                }),
                heightBox(13),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: lightBlack,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 6.0.w),
                      child: textWidget(title: or, fs: 14.sp, c: lightBlack),
                    ),
                    const Expanded(
                      child: Divider(
                        color: lightBlack,
                      ),
                    ),
                  ],
                ),
                heightBox(13),

                /// Google Login Button
                GestureDetector(
                  onTap: () {
                    controller.onTapGoogleLogin();
                  },
                  child: Container(
                    height: 60.h,
                    width: 355.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(width: 2.0.w, color: textFieldBorderColor),
                        color: hintTextColor.withOpacity(0.2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/Icons/google_Icon.svg",
                          height: 35.h,
                          width: 35.h,
                        ),
                        widthBox(5),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5.h),
                          child: textWidget(title: googleButtonText, c: blackColor, fs: 14.sp),
                        )
                      ],
                    ),
                  ),
                ),
                heightBox(10),

                /// Apple Login Button
                GestureDetector(
                  onTap: () {
                    controller.onTapAppleLogin();
                  },
                  child: Container(
                    height: 60.h,
                    width: 355.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(width: 2.0.w, color: textFieldBorderColor),
                        color: hintTextColor.withOpacity(0.2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/Icons/apple_icon.svg",
                          height: 25.h,
                          width: 25.h,
                          fit: BoxFit.fitHeight,
                        ),
                        widthBox(15),
                        textWidget(title: appleButtonText, c: blackColor, fs: 14.sp)
                      ],
                    ),
                  ),
                ),
                heightBox(20),
                RichText(
                  text: TextSpan(
                    text: alreadyHaveAnAccount,
                    style: TextStyle(color: Colors.black, fontSize: 14.sp),
                    children: <InlineSpan>[
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {
                            controller.onTapLogin();
                            print('Login tapped');
                          },
                          child: Text(
                            ' $login',
                            style: TextStyle(fontWeight: FontWeight.w500, color: themeColor, fontSize: 14.sp),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                heightBox(15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
