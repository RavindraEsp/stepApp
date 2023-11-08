import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_app/utilities/color_utility.dart';
import 'package:step_app/utilities/enum.dart';
import 'package:step_app/utilities/style_utility.dart';
import 'package:step_app/utilities/text_size_utility.dart';

class StopButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onTap;
  final ButtonType? buttonType;

  StopButton({
    Key? key,
    required this.buttonText,
    this.onTap,
    this.buttonType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: MediaQuery.of(context).size.width,


        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            shadowColor: Colors.transparent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            // This is what you need!
          ),
          child: Text(
            buttonText,
            maxLines: 1,
            style: StyleUtility.soraRegularWhiteTextStyle
                .copyWith(fontSize: TextSizeUtility.textSize16.sp),
          ),
        ));
  }
}
