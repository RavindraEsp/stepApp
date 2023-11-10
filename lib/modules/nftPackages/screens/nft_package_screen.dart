import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_app/utilities/color_utility.dart';
import 'package:step_app/utilities/image_utility.dart';
import 'package:step_app/utilities/style_utility.dart';
import 'package:step_app/utilities/text_size_utility.dart';

class NftPackageScreen extends StatefulWidget {
  const NftPackageScreen({super.key});

  @override
  State<NftPackageScreen> createState() => _NftPackageScreenState();
}

class _NftPackageScreenState extends State<NftPackageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.bgColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorUtility.whiteColor),
        elevation: 0,
        backgroundColor: ColorUtility.bgColor,
        centerTitle: true,
        title: Text(
          'NFTs Package',
          style: StyleUtility.headerTextStyle
              .copyWith(fontSize: TextSizeUtility.textSize16.sp),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              // Container(
              //
              //   alignment: Alignment.center,
              //   child: Image.asset(ImageUtility.termConditionCardImage,
              //       width: MediaQuery.of(context).size.width),
              // ),

              Expanded(
                child: GridView.builder(
                    padding: const EdgeInsets.only(top: 0),
                    //  itemCount: 3,
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.w,
                        mainAxisSpacing: 8.w,
                        mainAxisExtent: 180.0),
                    itemBuilder: (context, gridIndex) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.r)),
                        child: Padding(
                          padding: EdgeInsets.all(8.w),
                          child: Column(
                            children: [
                              // Image.asset(
                              //   ImageUtility.termConditionCardImage,
                              //   width: MediaQuery.of(context).size.width,
                              //   height: 106.sp,
                              //   fit: BoxFit.fill,
                              // ),


                            ],
                          ),
                        ),
                      );

                      // })))
                    }),
              )

              //  _renderSteps()
            ],
          ),
        ),
      ),
    );
  }
}
