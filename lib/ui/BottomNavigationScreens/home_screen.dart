import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('Home Page'),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(22.5.r),
          child: Container(
            height: 45.h,
            width: 45.h,
            color: Colors.red,
          ),
        ),
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(22.5.r),
            child: Container(
              height: 45.h,
              width: 45.h,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
