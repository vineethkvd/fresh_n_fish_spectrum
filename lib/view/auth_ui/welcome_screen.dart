import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app-constant.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.appScendoryColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppConstant.appScendoryColor,
        elevation: 0,
      ),
      body: Container(
        child: Column(children: [
          Expanded(
              child: Center(
            child: Container(
              alignment: Alignment.center,
              child: SizedBox(
                  width: 346.w,
                  height: 393.h,
                  child: SvgPicture.asset('assets/images/welcome image.svg')),
            ),
          )),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 20.0).w,
            width: MediaQuery.of(context).size.width,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 343.w,
                    child: Text(
                      'Discover Your Dream deals here',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFFFFD771),
                        fontSize: 32.sp,
                        fontFamily: 'Roboto-Bold',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 323.w,
                    child: Text(
                      'Explore all the existing job roles based on your interest and study major',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontFamily: 'Roboto-Regular',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Material(
                        child: Container(
                          width: 135.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: AppConstant.btnColor,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Login',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontFamily: 'Roboto-Bold',
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      Material(
                        child: Container(
                          width: 135.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: AppConstant.btnColorDark,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Register',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontFamily: 'Roboto-Bold',
                                ),
                              )),
                        ),
                      )
                    ],
                  )
                ]),
          )
        ]),
      ),
    );
  }
}
