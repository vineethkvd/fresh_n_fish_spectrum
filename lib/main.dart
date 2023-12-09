import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_n_fish_spectrum/view/auth_ui/splash-screen.dart';
import 'package:fresh_n_fish_spectrum/view/auth_ui/welcome_screen.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: const Size(360,800),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        home: WelcomeScreen(),
      ),
    );
  }
}
