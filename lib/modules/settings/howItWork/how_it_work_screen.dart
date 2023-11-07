import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_app/utilities/color_utility.dart';
import 'package:step_app/utilities/image_utility.dart';
import 'package:step_app/utilities/style_utility.dart';
import 'package:step_app/utilities/text_size_utility.dart';

class HowItWorkScreen extends StatefulWidget {
  const HowItWorkScreen({super.key});

  @override
  State<HowItWorkScreen> createState() => _HowItWorkScreenState();
}

class _HowItWorkScreenState extends State<HowItWorkScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.bgColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorUtility.whiteColor),
        elevation: 0,
        backgroundColor: ColorUtility.bgColor,
        centerTitle: false,
        title: Text(
          'How Stepmint Works',
          style: StyleUtility.headerTextStyle
              .copyWith(fontSize: TextSizeUtility.textSize16.sp),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(ImageUtility.howItWorkCardImage,
                      width: MediaQuery.of(context).size.width),
                ),

                SizedBox(
                  height: 24.h,
                ),

                Text(
                  "How Stepmint Works",
                  style: StyleUtility.soraBoldE8E8E8TextStyle
                      .copyWith(fontSize: TextSizeUtility.textSize16.sp),
                ),

                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Mobile app terms and conditions, also referred to as app terms of service or app terms of use, explain the rules, requirements, restrictions, and limitations that users must abide by in order to use a mobile application.,",
                  style: StyleUtility.soraRegular999999TextStyle
                      .copyWith(fontSize: TextSizeUtility.textSize14.sp),
                )

                //  _renderSteps()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
