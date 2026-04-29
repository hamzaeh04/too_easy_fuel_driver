import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel_driver/constants/color_constants.dart';
import 'package:too_easy_fuel_driver/features/setting/widgets/elevated_container.dart';
import 'package:too_easy_fuel_driver/widgets/customText_widget.dart';

Widget jobContainer({String? title, String? btnText, String? location, String? time, String? quantity, bool? isContinue, Widget? child, bool? isJobScreen = false, VoidCallback? ontap}){
  return InkWell(
    onTap: ontap,
    child: elevatedContainer(
      hPadding: 5.w,
      vPadding: 2.h,
      child: Column(
        children: [
          Row(
            children: [
              customText(
                text: title,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: blueColor,
                  fontFamily: "bl_melody"
              ),
              Spacer(),
              isJobScreen == true ? Icon(Icons.arrow_forward_ios_outlined, size: 16.5.sp, color: greyColor,):
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 0.75.h),
                decoration: BoxDecoration(
                  color: isContinue == true ? redColor.withValues(alpha: 0.20): greyColor.withValues(alpha: 0.20),
                  borderRadius: BorderRadius.circular(20.sp)
                ),
                child: customText(
                  text: btnText,
                  color: isContinue == true ? redAppBarColor: darkGreyColor,
                  fontSize: 14.5.sp
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/png/track_order/location.png", color: blackColor, width: 4.w,),
              SizedBox(width: 2.w,),
              customText(
                text: location,
                fontSize: 15.5.sp
              ),
            ],
          ),
          SizedBox(height: 2.5.h,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/png/clock.png", color: blackColor, width: 4.w,),
              SizedBox(width: 2.w,),
              customText(
                  text: time,
                  fontSize: 15.5.sp
              ),
              Spacer(),
              Image.asset("assets/png/track_order/quantity.png", color: blackColor, width: 4.w,),
              SizedBox(width: 1.5.w,),
              customText(
                  text: quantity,
                  fontSize: 15.5.sp
              ),
              if(isJobScreen == true)
              Spacer(),
              isJobScreen == true ?
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3.5.w,vertical: 0.75.h),
                decoration: BoxDecoration(
                    color: greyColor.withValues(alpha: 0.20),
                    borderRadius: BorderRadius.circular(20.sp)
                ),
                child: customText(
                    text: btnText,
                    color: blueColor,
                    fontSize: 14.5.sp,
                  fontWeight: FontWeight.w500
                ),
              ): SizedBox.shrink()
            ],
          ),
          SizedBox(height: child == null ? 0.h: 3.h,),
          ?child,
        ],
      )
    ),
  );
}

Widget tag({String? title}){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.5.h),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.sp),
        border: Border.all(color: blackColor.withValues(alpha: 0.35))
    ),
    child: customText(
      text: title,
      fontSize: 15.5.sp,
    ),
  );
}