import 'package:car_rental_app_ui/ui/Authentication/login_screen.dart';
import 'package:car_rental_app_ui/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Rentro',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            // home: const HomeScreen(),
            home: SplashScreen(),
          );
        });
  }
}
