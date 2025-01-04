import 'package:car_rental_app_ui/Controller/splash_two_controller.dart';
import 'package:car_rental_app_ui/constants/color_constant.dart';
import 'package:car_rental_app_ui/constants/message_string_const.dart';
import 'package:car_rental_app_ui/constants/text_constant.dart';
import 'package:car_rental_app_ui/constants/widget_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreenTwo extends StatelessWidget {
  SplashScreenTwo({Key? key}) : super(key: key);

  final splashTwoController = Get.put(SplashTwoController());

  @override
  Widget build(BuildContext context) {
    var controller = splashTwoController;
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: blackColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widthBox(Get.width),
            heightBox(90),
            Obx(() {
              controller.isChange.value;
              return TransformWidget(
                isChange: controller.isChange.value,
                widget: Image.asset(
                  "assets/Icons/Hello.png",
                  height: 154.h,
                  width: 154.h,
                ),
                x: 400,
                y: 0,
                timingMillisecond: 1500,
              );
            }),
            textWidget(
              ta: TextAlign.center,
              title: letFindCars,
              fs: 40.sp,
              fw: FontWeight.bold,
              c: whiteColor,
            ),
            heightBox(14),
            textWidget(title: "Enjoy Your Car Ride", c: whiteColor, fs: 14.sp),
            Align(
              alignment: Alignment.centerLeft,
              child: AnimatedBuilder(
                  animation: controller.animationControllers,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(controller.animations.value, 0),
                      child: Transform.translate(
                        offset: const Offset(0, 50),
                        child: Image.asset(
                          "assets/Images/splash_two_car.png",
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
