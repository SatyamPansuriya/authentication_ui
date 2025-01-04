import 'package:car_rental_app_ui/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget textWidget({required String title, FontWeight? fw, Color? c, double? fs, TextAlign? ta, int? maxLine, TextOverflow? ov}) {
  return Text(
    title,
    key: ValueKey(title),
    maxLines: maxLine,
    overflow: ov,
    textAlign: ta ?? TextAlign.start,
    style: TextStyle(fontFamily: "PopinsRegular", fontWeight: fw ?? FontWeight.normal, color: c ?? whiteColor, fontSize: fs ?? 14.sp),
  );
}
