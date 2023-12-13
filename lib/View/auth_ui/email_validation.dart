import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Utils/app-constant.dart';
class EmailValidationScreen extends StatefulWidget {
  final User user;
  const EmailValidationScreen({super.key, required this.user});

  @override
  State<EmailValidationScreen> createState() => _EmailValidationScreenState();
}

class _EmailValidationScreenState extends State<EmailValidationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstant.appScendoryColor,
        body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Column(children: [
            SizedBox(
              height: 10.h,
            ),
            Center(
              child: Text(
                'Verify your email address',
                style: TextStyle(
                  fontFamily: 'Roboto-Bold',
                  fontSize: 18.sp,
                  color: AppConstant.yellowText,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Center(
              child: Container(
                padding:
                EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Name: ${widget.user.displayName}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'Roboto-Regular',
                        fontWeight: FontWeight.w400,
                        color: AppConstant.appTextColor,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Email: ${widget.user.email}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'Roboto-Regular',
                        color: AppConstant.appTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            widget.user.emailVerified
                ? Center(
              child: Text(
                'Email is verified',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'Roboto-Regular',
                  color: Colors.lightGreenAccent,
                ),
              ),
            )
                : Center(
              child: Text(
                'Email is not verified',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'Roboto-Regular',
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
          ]),
        ),
      ),
    );
  }
}
