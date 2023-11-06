import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_app/utilities/image_utility.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
