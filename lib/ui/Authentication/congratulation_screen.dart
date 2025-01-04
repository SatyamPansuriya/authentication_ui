import 'package:car_rental_app_ui/constants/button_constant.dart';
import 'package:car_rental_app_ui/constants/color_constant.dart';
import 'package:car_rental_app_ui/constants/text_constant.dart';
import 'package:car_rental_app_ui/constants/widget_constant.dart';
import 'package:car_rental_app_ui/ui/Authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CongratulationScreen extends StatelessWidget {
  CongratulationScreen({Key? key}) : super(key: key);

  RxBool isProcessing = false.obs;

  @override
  Widget build(BuildContext context) {
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
            heightBox(127),
            Image.asset(
              "assets/Icons/Claps.png",
              height: 266.h,
              width: 266.h,
              fit: BoxFit.scaleDown,
            ),
            textWidget(
              title: "Congratulations ",
              c: themeColor,
              fs: 28.sp,
              fw: FontWeight.bold,
              ta: TextAlign.center,
            ),
            heightBox(10),
            textWidget(
              title: "Your password has changed ",
              c: blackColor,
              fs: 24.sp,
              fw: FontWeight.bold,
              ta: TextAlign.center,
            ),
            heightBox(10),
            textWidget(
                title: "Don’t worry, we’ll let you know if there’s a\nproblem with your account.", fs: 14.sp, ta: TextAlign.center, c: lightBlack),
            const Spacer(),
            Obx(() {
              return progressButton(
                  isProcessing: isProcessing.value,
                  onTap: () {
                    isProcessing.value = true;
                    Future.delayed(
                      const Duration(seconds: 2),
                      () {
                        navigationUntil(screen: LoginPage()).then((value) {
                          isProcessing.value = false;
                        });
                      },
                    );
                  },
                  title: "Bck to Login");
            }),
            heightBox(40),
          ],
        ),
      ),
    );
  }
}
