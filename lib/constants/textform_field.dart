import 'package:car_rental_app_ui/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Login & Sign up TextField
Widget textFormField({
  required TextEditingController textEditingController,
  required bool isObsecureText,
  Widget? suffixIcon,
  double verticalPadding = 15.0,
  required String hintText,
  String? Function(String?)? validator,
}) {
  return TextFormField(
    validator: validator,
    cursorColor: blackColor,
    controller: textEditingController,
    style: TextStyle(
      color: blackColor,
      fontSize: 14.sp,
      fontFamily: "Hanuman",
    ),
    obscureText: isObsecureText,
    decoration: InputDecoration(
      errorStyle: const TextStyle(
        color: Colors.redAccent,
        fontFamily: "Hanuman",
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(
          color: Colors.redAccent,
          width: 1.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(
          color: Colors.redAccent,
          width: 1.0,
        ),
      ),
      suffixIcon: suffixIcon ?? const SizedBox.shrink(),
      hintStyle: TextStyle(
        fontSize: 15.sp,
        color: hintTextColor,
        fontFamily: "Hanuman",
      ),
      hintText: hintText,
      contentPadding: EdgeInsets.symmetric(vertical: verticalPadding.h, horizontal: 10.0.w),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(
          color: textFieldBorderColor,
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(
          color: themeColor,
          width: 1.0,
        ),
      ),
    ),
  );
}
