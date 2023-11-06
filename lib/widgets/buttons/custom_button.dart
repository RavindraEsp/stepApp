import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_app/utilities/color_utility.dart';
import 'package:step_app/utilities/enum.dart';
import 'package:step_app/utilities/style_utility.dart';
import 'package:step_app/utilities/text_size_utility.dart';


class CustomButton extends StatelessWidget {
  final String buttonText;
  String? icon;
  final VoidCallback? onTap;
  final ButtonType? buttonType;



  CustomButton({
    Key? key,
    required this.buttonText,
     this.onTap,
    this.icon,
    this.buttonType,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Gradient gradient = LinearGradient(

        colors:  buttonType == ButtonType.borderType ?
        ColorUtility.borderButtonColor:
        ColorUtility.blueGradientColor
            );
    final borderRadius = BorderRadius.circular(8);
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,

        border:  buttonType == ButtonType.borderType ? Border.all(
            color: ColorUtility.colorF1E3FF
        ):
        null,
      ),
      child: ElevatedButton(


          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)),
          ),
          child: Text(buttonText,
              maxLines: 1,
          style: StyleUtility.soraRegularWhiteTextStyle.copyWith(
            fontSize: TextSizeUtility.textSize16.sp
          ),)),
    );
  }
}
