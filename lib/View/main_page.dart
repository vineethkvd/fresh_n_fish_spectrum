import 'package:flutter/material.dart';
import 'package:fresh_n_fish_spectrum/View/Widget/banner-widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/google-sign-in-controller.dart';
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _googleSignInController = Get.put(GoogleSignInController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main page"),
      ),
      body: Container(
        child: Column(
          children: [
            BannerWidget(),
            Center(
              child: ElevatedButton(onPressed: () {
                _googleSignInController.signOutGoogle();
              }, child: Text("Logout")),
            ),
          ],
        ),
      ),
    );
  }
}
