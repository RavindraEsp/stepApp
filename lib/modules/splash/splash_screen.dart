import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_app/modules/intro/intro_screen.dart';
import 'package:step_app/routes/route_name.dart';
import 'package:step_app/utilities/image_utility.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => const IntroScreen()));

      Navigator.pushReplacementNamed(context, RouteName.introScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(ImageUtility.splashBgImage), fit: BoxFit.fill),
      ),
      child: Center(
        child: Image.asset(
          ImageUtility.logo,
          width: 81.w,
          fit: BoxFit.fill,
        ),
      ),
    ));
  }
}
