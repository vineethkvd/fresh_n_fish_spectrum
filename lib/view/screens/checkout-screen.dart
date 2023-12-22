import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Utils/app-constant.dart';
import '../main_page.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appMainColor,
        elevation: 2,
        leading: IconButton(
            onPressed: () => Get.offAll(() => const MainPage(),
                transition: Transition.leftToRightWithFade),
            icon: const Icon(CupertinoIcons.back, color: Colors.white)),
        centerTitle: true,
        title: Text("Cart page",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontFamily: 'Roboto-Regular',
            )),
      ),
    );
  }
}
