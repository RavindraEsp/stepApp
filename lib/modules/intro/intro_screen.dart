import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_app/modules/settings/termCondition/term_condition_screen.dart';
import 'package:step_app/utilities/enum.dart';
import 'package:step_app/utilities/image_utility.dart';
import 'package:step_app/utilities/style_utility.dart';
import 'package:step_app/utilities/text_size_utility.dart';
import 'package:step_app/widgets/buttons/custom_button.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

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
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  ImageUtility.logo,
                  width: 143.w,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Image.asset(
                  ImageUtility.stepMintTextImage,
                  width: 143.w,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "Convert your steps into a currency to spend on products, offers and supporting charitable causes",
                  style: StyleUtility.soraRegularWhiteTextStyle
                      .copyWith(fontSize: TextSizeUtility.textSize16.sp),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 170.h),
                CustomButton(buttonText: "Connect Wallet"),
                SizedBox(
                  height: 24.h,
                ),
                CustomButton(
                  buttonText: "Sign up",
                  buttonType: ButtonType.borderType,
                ),
                SizedBox(
                  height: 16.h,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "By Creating Account you Accept ",
                    style: StyleUtility.soraRegularWhiteTextStyle.copyWith(
                      fontSize: TextSizeUtility.textSize13.sp,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Term of Use",
                        style: StyleUtility.soraRegularWhiteTextStyle.copyWith(
                          fontSize: TextSizeUtility.textSize13.sp,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => TermConditionScreen()));
                        // Single tapped.
                      },
                      ),
                      TextSpan(
                        text: " and ",
                        style: StyleUtility.soraRegularWhiteTextStyle.copyWith(
                          fontSize: TextSizeUtility.textSize13.sp,
                        ),
                      ),
                      TextSpan(
                        text: "Privacy Policy.",
                        style: StyleUtility.soraRegularWhiteTextStyle.copyWith(
                          fontSize: TextSizeUtility.textSize13.sp,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          // Single tapped.
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
