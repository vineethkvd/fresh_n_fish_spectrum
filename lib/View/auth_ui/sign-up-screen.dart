import 'package:flutter/material.dart';

import '../../Utils/app-constant.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.appScendoryColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppConstant.appScendoryColor,
        elevation: 0,
      ),
    );
  }
}
