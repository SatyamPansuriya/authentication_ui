import 'package:car_rental_app_ui/constants/button_constant.dart';
import 'package:car_rental_app_ui/constants/color_constant.dart';
import 'package:car_rental_app_ui/constants/message_string_const.dart';
import 'package:car_rental_app_ui/constants/text_constant.dart';
import 'package:car_rental_app_ui/constants/widget_constant.dart';
import 'package:car_rental_app_ui/ui/Authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationActivate extends StatelessWidget {
  const LocationActivate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                heightBox(16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 35.h,
                    width: 35.h,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
                heightBox(70),
                SvgPicture.asset(
                  "assets/Images/LocationActivate.svg",
                  height: 172.h,
                  width: 339.w,
                  fit: BoxFit.scaleDown,
                ),
                heightBox(70),
                textWidget(title: locationAccess, c: themeColor, fs: 28, fw: FontWeight.bold),
                heightBox(15),
                textWidget(
                  title: locationAccessDescription,
                  fs: 14.sp,
                  c: const Color(0xff010101),
                  ta: TextAlign.center,
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 23.h),
                  child: buttonWidget(
                    title: grantAccess,
                    onTap: () {
                      navigationReplace(screen: LoginPage());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
