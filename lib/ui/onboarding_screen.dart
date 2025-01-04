import 'package:car_rental_app_ui/Controller/onBoarding_screen_controller.dart';
import 'package:car_rental_app_ui/constants/color_constant.dart';
import 'package:car_rental_app_ui/constants/const_data.dart';
import 'package:car_rental_app_ui/constants/message_string_const.dart';
import 'package:car_rental_app_ui/constants/text_constant.dart';
import 'package:car_rental_app_ui/constants/widget_constant.dart';
import 'package:car_rental_app_ui/ui/Authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  final OnBoardingScreenController onBoardingScreenController = Get.put(OnBoardingScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: blackColor,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            heightBox(70),
            SizedBox(
              height: 361.h,
              width: 346.h,
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: onBoardingScreenController.controller,
                itemCount: 3,
                onPageChanged: (int page) {},
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(15.0.r),
                    height: 100.h,
                    width: 100.h,
                    child: SvgPicture.asset(onBoarding[index]["image"], fit: BoxFit.cover),
                  );
                },
              ),
            ),
            heightBox(106),
            SmoothPageIndicator(
                controller: onBoardingScreenController.controller, // PageController
                count: 3,
                effect: SlideEffect(
                    spacing: 10.0,
                    radius: 5.0,
                    dotWidth: 10.0.h,
                    dotHeight: 10.0.h,
                    paintStyle: PaintingStyle.fill,
                    strokeWidth: 1.5,
                    dotColor: whiteColor.withOpacity(0.3),
                    activeDotColor: themeColor), // your preferred effect
                onDotClicked: (index) {}),
            heightBox(41),
            SizedBox(
              height: 110.h,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: onBoardingScreenController.controller2,
                itemCount: 3,
                onPageChanged: (int page) {},
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      textWidget(
                          title: onBoarding[index]["title"], ta: TextAlign.center /*"Self Drive Cars Near You"*/, fs: 18.sp, fw: FontWeight.bold),
                      heightBox(5),
                      textWidget(
                        title: onBoarding[index]["description"] /*"Convenient Locations Just \na Short Walk Away. "*/,
                        c: whiteColor.withOpacity(0.5),
                        ta: TextAlign.center,
                        fs: 14.sp,
                      ),
                    ],
                  );
                },
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 15.h),
              child: Obx(() {
                onBoardingScreenController.currrentPage.value;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        navigation(
                          screen: LoginPage(),
                        );
                      },
                      child: AnimatedContainer(
                        width: onBoardingScreenController.currrentPage.value == 2 ? 0 : null,
                        duration: const Duration(milliseconds: 1000),
                        child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 1000),
                            opacity: onBoardingScreenController.currrentPage.value == 2 ? 0.0 : 1.0,
                            child: textWidget(title: skip, c: Colors.white.withOpacity(0.5))),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        onBoardingScreenController.onNextTap();
                      },
                      child: AnimatedContainer(
                        height: onBoardingScreenController.currrentPage.value == 2 ? 60.h : 55.h,
                        width: onBoardingScreenController.currrentPage.value == 2 ? 291.w : 130.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: themeColor, borderRadius: BorderRadius.circular(15.r)),
                        duration: const Duration(milliseconds: 1200),
                        curve: Curves.easeInOut,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedSwitcher(
                                duration: const Duration(milliseconds: 1000),
                                child: onBoardingScreenController.currrentPage.value == 2
                                    ? textWidget(
                                        title: done,
                                        fs: 18.sp,
                                      )
                                    : textWidget(
                                        title: next,
                                        fs: 18.sp,
                                      )),
                            AnimatedContainer(
                              width: onBoardingScreenController.currrentPage.value == 2 ? 0 : 15.64.w,
                              duration: const Duration(milliseconds: 1000),
                            ),
                            SvgPicture.asset(
                              width: onBoardingScreenController.currrentPage.value == 2 ? 0 : 33.w,
                              "assets/Icons/right_arrow.svg",
                              color: whiteColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
