import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel_driver/constants/color_constants.dart';
import 'package:too_easy_fuel_driver/constants/local_db_key.dart';
import 'package:too_easy_fuel_driver/core/services/shared_prefrences_methods.dart';
import 'package:too_easy_fuel_driver/features/inventory/controller/inventory_controller.dart';
import 'package:too_easy_fuel_driver/features/setting/widgets/elevated_container.dart';
import 'package:too_easy_fuel_driver/widgets/app_bar_widget.dart';
import 'package:too_easy_fuel_driver/widgets/background_widget.dart';
import 'package:too_easy_fuel_driver/widgets/button_widget.dart';
import 'package:too_easy_fuel_driver/widgets/customText_widget.dart';
import 'package:too_easy_fuel_driver/widgets/custom_dialog_widget.dart';
import 'package:too_easy_fuel_driver/widgets/custom_text_feild.dart';

import '../../../utils/utility.dart';
import '../controller/mileage_controller.dart';

class MileageScreen extends GetView<MileageController> {
  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: radialBackground(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appBar("Mileage", isBack: false),
          Expanded(child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2.5.h,),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText(
                              text: "Mileage Tracking",
                              fontSize: 19.75.sp,
                              fontWeight: FontWeight.bold,
                              color: blueColor,
                              fontFamily: "bl_melody",
                              height: 1.15
                          ),
                          customText(
                            text: "Track your daily mileage for\nreporting",
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      Spacer(),
                      SizedBox(
                        width: 30.w,
                        child: buttonWidget("+ New Log", whiteColor, isGradient: true, fontsize: 16.25.sp,
                            onTap: ()=> customDialogMileage(context, title: "Add Mileage Log", btnText: "Start Mileage Log", controller: controller.startingMileage, ontap: (){
                              if(controller.startingMileage.text.isNotEmpty && controller.startingMileage.text != null){
                                controller.startLog(controller.startingMileage.text);
                                controller.startingMileage.clear();
                                Get.back();
                              } else{
                                Utils.showToast("Fill the field first", true);
                              }
                            })),),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  elevatedContainer(
                    hPadding: 6.w,
                    vPadding: 3.h,
                    gradient: LinearGradient(
                      colors: [lightBlueColor, Color(0xFFEFF6FF)],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText(
                                text: "Total Mileage",
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500
                            ),
                            SizedBox(height: 0.55.h,),
                            customText(
                                text: "30",
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w600,
                                color: blueColor,
                                fontFamily: "bl_melody",
                                height: 1
                            ),
                            customText(
                                text: "miles tracked",
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                height: 1
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.55.h),
                            decoration: BoxDecoration(
                              color: neonLightBlueColor, // light green accent
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset("assets/png/navbar/Mileage-icon.png", width: 8.5.w, color: neonBlueColor,)
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 1.75.h,),
                  customText(
                      text: "Mileage History",
                      fontSize: 18.75.sp,
                      fontWeight: FontWeight.bold,
                      color: blueColor,
                      fontFamily: "bl_melody",
                      height: 1.15
                  ),
                  SizedBox(height: 1.5.h,),
                  Obx((){
                    return elevatedContainer(
                      hPadding: 5.5.w,
                      vPadding: 2.5.h,
                      gradient: controller.isLogged.value
                          ? LinearGradient(
                        colors: [lightBlueColor, Color(0xFFEFF6FF)],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      )
                          : null,
                      child: controller.isLogged.value ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  customText(
                                      text: "Active Log",
                                      fontSize: 16.5.sp,
                                      fontWeight: FontWeight.w700,
                                      color: blueColor,
                                      fontFamily: "bl_melody"
                                  ),
                                  customText(
                                    text: "Mar 17, 2026",
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                height: 1.25.h,
                                width: 3.w,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: sharpBlueColor
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 2.h),

                          customText(
                              text: "Starting Mileage",
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500
                          ),
                          SizedBox(height: 0.55.h,),
                          customText(
                              text: controller.prefs.getString(LocalDBKeys.STARTMILEAGE),
                              fontSize: 20.5.sp,
                              fontWeight: FontWeight.w700,
                              color: blueColor,
                              fontFamily: "bl_melody",
                              height: 1
                          ),
                          SizedBox(height: 0.20.h,),

                          customText(
                              text: "Ending Mileage",
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              height: 1

                          ),
                          SizedBox(height: 3.h),
                          customTextField(controller: controller.endingMileage, "Starting Mileage", "Enter ending mileage", isObscure: false.obs, isCompulsory: true),
                          SizedBox(height: 1.5.h),
                          buttonWidget("Complete Log", whiteColor, isGradient: true, onTap: (){
                            controller.prefs.setString(LocalDBKeys.ENDMILEAGE, controller.endingMileage.text);
                            double start = double.tryParse(controller.prefs.getString(LocalDBKeys.STARTMILEAGE) ?? "0") ?? 0.0;
                            double end = double.tryParse(controller.prefs.getString(LocalDBKeys.ENDMILEAGE) ?? "0") ?? 0.0;

                            if (start >= end) {
                              print("${start} ${end}");
                              customDialog(context, title: "Ending mileage must be greater\nthan starting mileage", containerClr: redSharpColor, imgPath: "assets/png/home/alert_icon.png", imageClr: whiteColor,);
                            } else {
                              print("${start} ${end}");
                              controller.endingMileage.clear();
                            }
                          })
                        ],
                      ):
                      Column(
                        children: [
                          Image.asset(
                            "assets/png/track_order/location.png",
                            width: 10.w,
                          ),
                          SizedBox(height: 2.h),
                          customText(
                            text: "No mileage logs yet",
                            fontSize: 16.5.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(height: 1.h),
                          customText(
                            text: "Start tracking your daily mileage",
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: darkGreyColor,
                          ),
                        ],
                      ),
                    );
                  }),
                  Obx((){
                    if(controller.isLogged.value){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2.5.h,),
                          customText(
                              text: "Green Valley Farms",
                              fontFamily: "bl_melody",
                              fontSize: 18.5.sp,
                              fontWeight: FontWeight.w600,
                              color: blueColor
                          ),
                          SizedBox(height: 1.h,),
                          elevatedContainer(
                              vPadding: 2.h,
                              hPadding: 5.w,
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.20.h),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: greyColor.withValues(alpha: 0.25)
                                    ),
                                    child: Image.asset("assets/png/calendar.png", width: 5.w, color: blackColor.withValues(alpha: 0.7),),
                                  ),
                                  SizedBox(width: 3.w,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      customText(
                                          text: "Mar 17, 2026",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15.5.sp
                                      ),
                                      customText(
                                          text: "0.6 mi -> In Progress",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15.5.sp
                                      )
                                    ],
                                  )
                                ],
                              )
                          )
                        ],
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  }),
                  SizedBox(height: 1.5.h,),
                  elevatedContainer(
                      hPadding: 4.5.w,
                      vPadding: 1.25.h,
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 15.25.sp,
                            color: blackColor, // make sure to set your default color
                            height: 1.4, // optional: improves readability
                          ),
                          children: [
                            TextSpan(
                              text: "Note: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "inter",
                                  fontSize: 15.25.sp
                              ),
                            ),
                            TextSpan(
                                text: "Fuel inventory is automatically deducted when you complete a delivery. Make sure to refill when levels get low to ensure uninterrupted service.",
                                style: TextStyle(
                                    fontFamily: "inter",
                                    fontSize: 15.25.sp

                                )
                            ),
                          ],
                        ),
                      )
                  ),
                  SizedBox(height: 5.h,),

                ],
              ),
            ),
          ))
        ],
      )),
    );
  }
}
