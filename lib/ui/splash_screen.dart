import 'package:car_rental_app_ui/Controller/splash_controller.dart';
import 'package:car_rental_app_ui/constants/color_constant.dart';
import 'package:car_rental_app_ui/constants/text_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    var controller = splashController;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: blackColor,
        alignment: Alignment.center,
        child: textWidget(
          title: "SplashScreen",
          c: whiteColor,
          fw: FontWeight.bold,
          fs: 25.sp,
        ),
        // child: Image.asset("name"),
      ),
    );
  }
}
