import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_app/utilities/color_utility.dart';
import 'package:step_app/utilities/style_utility.dart';
import 'package:step_app/utilities/text_size_utility.dart';
import 'package:step_app/widgets/buttons/custom_button.dart';

class SelectCountryScreen extends StatefulWidget {
  const SelectCountryScreen({super.key});

  @override
  State<SelectCountryScreen> createState() => _SelectCountryScreenState();
}

class _SelectCountryScreenState extends State<SelectCountryScreen> {
  int _selectedIndex = -1; // Index of the selected checkbox, -1 for none

  List<String> items = ['India', 'Australia', 'Canada', 'Bangladesh', 'Germany','Argentina','China',
  'Afghanistan',
  'Brazil'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.colorFBF8FF,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                "Select your Country",
                style: StyleUtility.soraSemiBold2F3034TextStyle
                    .copyWith(fontSize: TextSizeUtility.textSize16.sp),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: 25.h),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: Container(
                      color: _selectedIndex == index
                          ? ColorUtility.colorF1E3FF
                          : ColorUtility.colorFBF8FF,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 16.h, bottom: 16.h),
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Text(
                              items[index],
                              style: StyleUtility.soraSemiBold2F3034TextStyle
                                  .copyWith(
                                      fontSize: TextSizeUtility.textSize16.sp),
                            ),
                          ),
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width,
                            color: ColorUtility.borderColor,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomButton(buttonText: "Continue"),
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}
