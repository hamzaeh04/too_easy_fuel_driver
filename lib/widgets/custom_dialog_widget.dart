import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel_driver/widgets/custom_text_feild.dart';
import '../constants/color_constants.dart';
import 'button_widget.dart';
import 'customText_widget.dart';

Future<void> customDialog(BuildContext context, {Color? containerClr, String? imgPath, Color? imageClr, String? title, String? btnText, Color? btnTextClr, VoidCallback? ontap, VoidCallback? ontapCancel, bool? isButton2 = false, String? btnText2, double? width}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: whiteColor,
        child: SizedBox(
          width: width ?? 40.w,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.5.w, vertical: 2.5.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // important to avoid full height
                  children: [
                    SizedBox(height: 1.h,),
                    Center(
                      child: Container(
                        height: 6.h,
                        width: 14.w,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: containerClr ?? blueColor
                        ),
                        child: Image.asset(imgPath ?? "assets/png/check_icon.png", color: imageClr ?? whiteColor,),
                      ),
                    ),
                    SizedBox(height: 2.h,),
                    customText(
                        textAlign: TextAlign.center,
                        text: title,
                        maxLines: 3,
                        overFlow: TextOverflow.visible
                    ),
                    SizedBox(height: 2.h,),
                    buttonWidget(btnText ?? "Ok", btnTextClr ?? whiteColor, isGradient: true, onTap: ontap ?? (){
                      Get.back();
                    },fontsize: 15.sp),
                    SizedBox(height: 1.h,),
                    if(isButton2 == true)
                      buttonWidget(btnText2 ?? "Ok", blueColor, borderColor: blueColor, onTap: (){
                        Get.back();
                      },fontsize: 15.sp),
                  ],
                ),
              ),
              Positioned(top: 1.h, right: 2.5.w, child: InkWell(
                  onTap: ontapCancel ?? (){
                    Get.back();
                  },
                  child: Icon(Icons.cancel_outlined,)))
            ],
          ),
        )
      );
    },
  );
}

Future<void> customDialogMileage(BuildContext context, {String? title, String? btnText, Color? btnTextClr, VoidCallback? ontap, VoidCallback? ontapCancel, TextEditingController? controller}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
          backgroundColor: whiteColor,
          child: SizedBox(
            width: 70.w,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.5.w, vertical: 2.5.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // important to avoid full height
                    children: [
                      customText(
                          textAlign: TextAlign.center,
                          text: title,
                          fontSize: 16.75.sp,
                        fontWeight: FontWeight.w600
                      ),
                      SizedBox(height: 1.h,),
                      customTextField(controller: controller, "Starting Mileage", "0.5", isObscure: false.obs, isCompulsory: true),
                      SizedBox(height: 2.h,),
                      buttonWidget(btnText ?? "Ok", btnTextClr ?? whiteColor, isGradient: true, onTap: ontap ?? (){
                        Get.back();
                      },fontsize: 15.sp),

                    ],
                  ),
                ),
                Positioned(top: 1.h, right: 2.5.w, child: InkWell(
                    onTap: ontapCancel ?? (){
                      Get.back();
                    },
                    child: Icon(Icons.cancel_outlined, size: 20.5.sp,)))
              ],
            ),
          )
      );
    },
  );
}
