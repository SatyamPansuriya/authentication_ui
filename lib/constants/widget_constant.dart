import 'package:car_rental_app_ui/constants/color_constant.dart';
import 'package:car_rental_app_ui/constants/text_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

Future<void> navigation({required var screen}) async {
  await Get.to(
    screen,
    transition: Transition.fadeIn,
    duration: const Duration(milliseconds: 500),
  );
}

Future<void> navigationReplace({required var screen}) async {
  await Get.off(
    screen,
    transition: Transition.fadeIn,
    duration: const Duration(milliseconds: 500),
  );
}

Future<void> navigationUntil({required var screen}) async {
  await Get.offAll(
    screen,
    transition: Transition.fadeIn,
    duration: const Duration(milliseconds: 500),
  );
}

Widget heightBox(double height) {
  return SizedBox(height: height.h);
}

Widget widthBox(double width) {
  return SizedBox(width: width.w);
}

showSnackbar({required String errorMessage, required Color color, required String title}) {
  Get.snackbar("", "",
      titleText: SizedBox(width: 230.w, child: textWidget(title: title, fw: FontWeight.bold, fs: 16.sp, c: whiteColor, ta: TextAlign.left)),
      messageText: Row(
        children: [
          SvgPicture.asset("assets/Icons/alert.svg", height: 24.w, width: 24.w, color: whiteColor),
          widthBox(11.w),
          SizedBox(
              width: 230.w,
              child: textWidget(
                title: "Email or password is incorrect, please check again.",
                ta: TextAlign.left,
                fs: 16.sp,
                maxLine: 2,
                ov: TextOverflow.ellipsis,
              ))
        ],
      ),
      borderRadius: 8.r,
      backgroundColor: color,
      maxWidth: 327.w,
      padding: EdgeInsets.all(16.r),
      snackPosition: SnackPosition.TOP);
}

class TransformWidget extends StatefulWidget {
  TransformWidget({
    Key? key,
    this.distance = 100,
    this.timingMillisecond = 1000,
    this.totalWidget = 10,
    this.isChange = false,
    this.x = -250,
    this.y = -250,
    required this.widget,
  }) : super(key: key);
  final int distance;
  final int timingMillisecond;
  final int totalWidget;
  final double x;
  final double y;
  bool isChange;
  final Widget widget;

  @override
  State<TransformWidget> createState() => _TransformWidgetState();
}

class _TransformWidgetState extends State<TransformWidget> with TickerProviderStateMixin {
  late List<AnimationController> animationControllers;
  late List<Animation<double>> animations;
  late List<Animation<double>> animationsTwo;

  @override
  void initState() {
    super.initState();
    animationControllers = List.generate(
      widget.totalWidget,
      (index) => AnimationController(
        vsync: this,
        duration: Duration(milliseconds: (index * widget.distance) + widget.timingMillisecond),
      ),
    );

    animations = animationControllers.map((controller) {
      return Tween<double>(begin: widget.y, end: 0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOut),
      );
    }).toList();

    animationsTwo = animationControllers.map((controller) {
      return Tween<double>(begin: widget.x, end: 0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOut),
      );
    }).toList();
  }

  @override
  void dispose() {
    animationControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isChange) {
      animationControllers.forEach((controller) => controller.forward());
    } else {
      animationControllers.forEach((controller) => controller.reverse());
    }
    return Stack(
      children: List.generate(widget.totalWidget, (index) {
        return AnimatedBuilder(
          animation: animationControllers[index],
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(animationsTwo[index].value, animations[index].value),
              child: child,
            );
          },
          child: Opacity(
            opacity: index == 0 ? 1 : 1 / index,
            child: widget.widget,
          ),
        );
      }),
    );
  }
}
