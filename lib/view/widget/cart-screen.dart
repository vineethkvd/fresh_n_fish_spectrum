import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Utils/app-constant.dart';
import '../main_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.appMainColor,
          elevation: 2,
          leading: IconButton(
              onPressed: () => Get.offAll(() => const MainPage(),
                  transition: Transition.leftToRightWithFade),
              icon: Icon(CupertinoIcons.back, color: Colors.white)),
          centerTitle: true,
          title: Text("Cart page",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontFamily: 'Roboto-Regular',
              )),
        ),
        body: Container(
          width: Get.width,
          height: Get.height,
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: []),
        ),
      ),
    );
  }
}
