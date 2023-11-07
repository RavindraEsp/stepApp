import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_app/routes/route_name.dart';
import 'package:step_app/utilities/color_utility.dart';
import 'package:step_app/utilities/image_utility.dart';
import 'package:step_app/utilities/style_utility.dart';
import 'package:step_app/utilities/text_size_utility.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorUtility.bgColor,
      backgroundColor: ColorUtility.colorFBF8FF,
      appBar: AppBar(
        iconTheme: const IconThemeData(
            // color: ColorUtility.whiteColor
            color: Colors.black),
        elevation: 0,
        // backgroundColor: ColorUtility.bgColor,
        backgroundColor: ColorUtility.colorFBF8FF,
        centerTitle: false,
        title: Text(
          'Setting',
          style: StyleUtility.headerTextStyle.copyWith(
              fontSize: TextSizeUtility.textSize16.sp, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 25.h,
            ),
            SettingTileWidget(
              title: "How its Work",
              image: ImageUtility.walletIcon,
              onTap: () {
                Navigator.pushNamed(context, RouteName.howItWorkScreen);
              },
            ),
            SettingTileWidget(
              title: "Wallet",
              image: ImageUtility.walletIcon,
              onTap: () {},
            ),
            SettingTileWidget(
              title: "Referral System",
              image: ImageUtility.referIcon,
              onTap: () {},
            ),
            SettingTileWidget(
              title: "Edit Profile",
              image: ImageUtility.profileIcon,
              onTap: () {},
            ),
            SettingTileWidget(
              title: "Change Password",
              image: ImageUtility.passwordIcon,
              onTap: () {},
            ),
            SettingTileWidget(
              title: "Help & Support",
              image: ImageUtility.helpSupportIcon,
              onTap: () {

              },
            ),
            SettingTileWidget(
              title: "Terms & Conditions",
              image: ImageUtility.termConditionIcon,
              onTap: () {
                Navigator.pushNamed(context, RouteName.termConditionScreen);
              },
            ),
            SettingTileWidget(
              title: "Privacy Policy",
              image: ImageUtility.privacyPolicyIcon,
              onTap: () {
                Navigator.pushNamed(context, RouteName.privacyPolicyScreen);

              },
            ),
            SettingTileWidget(
              title: "FAQs",
              image: ImageUtility.faqIcon,
              onTap: () {},
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(
                    left: 25.w, right: 25.w, top: 10.h, bottom: 10.h),
                child: Row(
                  children: [
                    Image.asset(
                      ImageUtility.logOutIcon,
                      width: 20.w,
                      height: 20.w,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Expanded(
                      child: Text(
                        "Logout",
                        style: StyleUtility.soraRegular2F3034TextStyle.copyWith(
                            fontSize: TextSizeUtility.textSize16.sp,
                            color: ColorUtility.colorFC2E2E),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 35.h,
            ),
          ],
        ),
      ),
    );
  }
}

class SettingTileWidget extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;

  const SettingTileWidget({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding:
            EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h, bottom: 10.h),
        child: Row(
          children: [
            Image.asset(
              image,
              width: 20.w,
              height: 20.w,
              fit: BoxFit.fill,
            ),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
              child: Text(
                title,
                style: StyleUtility.soraRegular2F3034TextStyle
                    .copyWith(fontSize: TextSizeUtility.textSize16.sp),
              ),
            ),
            Image.asset(
              ImageUtility.forwardIcon,
              width: 8.w,
            )
          ],
        ),
      ),
    );
  }
}
