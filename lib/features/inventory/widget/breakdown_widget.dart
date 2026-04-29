import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel_driver/constants/color_constants.dart';
import 'package:too_easy_fuel_driver/widgets/customText_widget.dart';

Widget breakDown({String? title, String? subTitle, String? quantity, Color? txtColor}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customText(
            text: title,
            fontSize: 15.5.sp,
            fontWeight: FontWeight.w600
          ),
          customText(
              text: subTitle,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            color: greyColor
          ),
        ],
      ),
      Spacer(),
      customText(
          text: quantity,
          fontSize: 15.5.sp,
          fontWeight: FontWeight.w600,
        color: txtColor ?? blackColor
      ),
    ],
  );
}