import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_n_fish_spectrum/Utils/app-constant.dart';
import 'package:fresh_n_fish_spectrum/View/Widget/banner-widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/get-user-data-controller.dart';
import '../Controller/google-sign-in-controller.dart';
import 'Widget/category-widget.dart';
import 'Widget/custom-drawer-widget.dart';
import 'Widget/product-list-widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GoogleSignInController _googleSignInController =
      Get.put(GoogleSignInController());
  final GetUserDataController _getUserDataController =
      Get.put(GetUserDataController());
  User? user = FirebaseAuth.instance.currentUser;
  Widget getTextField(
      {required String hint,
      required var icons,
      required var validator,
      required var controller,
      required var keyboardType}) {
    return TextFormField(
      keyboardType: keyboardType,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          errorStyle: const TextStyle(
            color: Colors.yellow,
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          prefixIcon: icons,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 13.h),
          filled: true,
          fillColor: const Color(0xFFF1F4FF),
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.black54,
            fontFamily: 'Roboto-Regular',
            fontSize: 15.sp,
            height: 0.h,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: IconButton(
                  onPressed: () {
                    return null;
                  },
                  icon: Icon(
                    CupertinoIcons.cart,
                    color: Colors.white,
                    size: 30,
                  )),
            )
          ],
          backgroundColor: AppConstant.appMainColor,
          title: FutureBuilder<List<QueryDocumentSnapshot<Object?>>>(
            future: _getUserDataController.getUserData(user!.uid),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Return a loading indicator or placeholder widget
                return const CupertinoActivityIndicator();
              } else if (snapshot.hasError) {
                // Handle error
                return Text('Error: ${snapshot.error}');
              } else {
                // Data has been loaded successfully
                List<QueryDocumentSnapshot<Object?>> data = snapshot.data!;

                // Rest of your widget tree using the 'data'

                return Text(
                    "Hi, ${data.isNotEmpty ? data[0]['username'] : 'N/A'}",
                    style: TextStyle(
                      color: AppConstant.appTextColor,
                      fontFamily: 'Roboto-Regular',
                      fontSize: 15.sp,
                      height: 0.h,
                    ));
              }
            },
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(105),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: getTextField(
                  hint: "search",
                  icons: const Icon(Icons.search),
                  validator: null,
                  controller: null,
                  keyboardType: null,
                ),
              ),
            ),
          ),
        ),
        drawer: const DrawerWidget(),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: BannerWidget(),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CategoryWidget(),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GetProductWidget(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
