import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';

import '../../Utils/app-constant.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstant.appScendoryColor,
        extendBodyBehindAppBar: true,
        body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Center(
                child: Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                      width: 227.w,
                      height: 49.48.h,
                      child: SvgPicture.asset('assets/images/applogo.svg')),
                ),
              )),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 20.0).w,
                width: MediaQuery.of(context).size.width,
                child: Column(children: [
                  SizedBox(
                    height: 22.h,
                    width: 22.w,
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    AppConstant.appPoweredBy,
                    style: TextStyle(
                        color: AppConstant.appTextColor,
                        fontFamily: 'Roboto-Bold',
                        fontSize: 12.0.sp,
                        ),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
