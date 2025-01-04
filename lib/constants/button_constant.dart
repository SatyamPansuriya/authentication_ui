import 'package:car_rental_app_ui/constants/color_constant.dart';
import 'package:car_rental_app_ui/constants/text_constant.dart';
import 'package:car_rental_app_ui/constants/text_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget buttonWidget({required String title, required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 60.h,
      width: 334.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: themeColor, borderRadius: BorderRadius.circular(15.r)),
      child: textWidget(title: title, c: whiteColor, fs: 18.sp, ta: TextAlign.center),
    ),
  );
}

Widget progressButton({required bool isProcessing, required VoidCallback onTap, required String title}) {
  return GestureDetector(
    onTap: !isProcessing ? onTap : null,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 700),
      height: 60.h,
      width: !isProcessing ? 334.w : 60.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: themeColor, borderRadius: BorderRadius.circular(!isProcessing ? 15.r : 30.r)),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 700),
        child: !isProcessing
            ? textWidget(
                title: title,
                c: whiteColor,
                fs: 18.sp,
                ta: TextAlign.center,
              )
            : const CircularProgressIndicator(color: whiteColor),
      ),
    ),
  );
}

Widget backButton({required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 40.w,
      width: 40.w,
      decoration: BoxDecoration(
          color: textFieldBorderColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(width: 1.0.r, color: lightBlack.withOpacity(0.6))),
      child: Icon(Icons.arrow_back_rounded, size: 22.r, color: blackColor),
    ),
  );
}
