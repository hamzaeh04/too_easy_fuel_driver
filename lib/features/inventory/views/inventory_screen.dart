import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel_driver/constants/color_constants.dart';
import 'package:too_easy_fuel_driver/features/inventory/controller/inventory_controller.dart';
import 'package:too_easy_fuel_driver/features/setting/widgets/elevated_container.dart';
import 'package:too_easy_fuel_driver/widgets/app_bar_widget.dart';
import 'package:too_easy_fuel_driver/widgets/background_widget.dart';
import 'package:too_easy_fuel_driver/widgets/button_widget.dart';
import 'package:too_easy_fuel_driver/widgets/customText_widget.dart';
import 'package:too_easy_fuel_driver/widgets/custom_dialog_widget.dart';

import '../widget/breakdown_widget.dart';

class InventoryScreen extends GetView<InventoryController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: radialBackground(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appBar("Inventory", isBack: false),
          Expanded(child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2.5.h,),
                  customText(
                    text: "Fuel Inventory",
                    fontSize: 19.75.sp,
                    fontWeight: FontWeight.bold,
                    color: blueColor,
                    fontFamily: "bl_melody",
                    height: 1.15
                  ),
                  customText(
                    text: "Monitor your daily fuel levels",
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500
                  ),
                  SizedBox(height: 2.h,),
                  elevatedContainer(
                    hPadding: 5.w,
                    vPadding: 2.25.h,
                    gradient: LinearGradient(
                      colors: [lightBlueColor, Color(0xFFEFF6FF)],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText(
                                    text: "Current Inventory",
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500
                                ),
                                SizedBox(height: 0.5.h,),
                                customText(
                                    text: "2000",
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w600,
                                    color: blueColor,
                                    fontFamily: "bl_melody",
                                    height: 1
                                ),
                                customText(
                                    text: "gallons remaining",
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    height: 1
                                ),
                              ],
                            ),
                            Spacer(),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.25.h),
                                decoration: BoxDecoration(
                                  color: neonBlueColor.withValues(alpha: 0.20), // light green accent
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset("assets/png/navbar/Inventory-icon.png", width: 7.w, color: neonBlueColor,)
                            ),
                          ],
                        ),
                        SizedBox(height: 2.5.h,),
                        Row(
                          children: [
                            customText(
                                text: "Capacity",
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500
                            ),
                            Spacer(),
                            customText(
                                text: "87.5% - Good",
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                              color: neonGreenColor
                            ),
                          ],
                        ),
                        SizedBox(height: 0.5.h,),
                        SizedBox(
                          height: 1.25.h,
                          child: LinearProgressIndicator(
                            color: blackColor,
                            backgroundColor: greyColor.withValues(alpha: 0.75),
                            value: 0.9,
                            borderRadius: BorderRadius.circular(20.sp),
                          ),
                        ),
                        SizedBox(height: 0.5.h,),
                        customText(
                            text: "1750 of 2000 gallons",
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          color: blackColor.withValues(alpha: 0.5)
                        ),
                      ],
                    )
                  ),
                  SizedBox(height: 1.75.h,),
                  buttonWidget("+Request Fuel", whiteColor, isGradient: true, onTap: (){
                    customDialog(context, title: "New fuel request received. Please review and take action.", imgPath: "assets/png/home/alert_icon.png", containerClr: redSharpColor);
                  }),
                  SizedBox(height: 1.75.h,),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: (){},
                          child: elevatedContainer(
                            vPadding: 2.75.h,
                            hPadding: 5.75.w,
                            containerColor: whiteColor,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    customText(
                                        text: "Fuel\nInventory",
                                        fontSize: 15.5.sp,
                                        fontWeight: FontWeight.w500,
                                        color: blackColor,
                                        fontFamily: 'inter',
                                        height: 1.10
                                    ),
                                    Spacer(),
                                    Container(
                                        padding: EdgeInsets.all(12.sp),
                                        decoration: BoxDecoration(
                                          color: neonGreenColor.withValues(alpha: 0.19), // light green accent
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset("assets/png/track_order/quantity.png", height: 2.25.h, color: neonGreenColor,)
                                    ),
                                  ],
                                ),
                                SizedBox(height: 1.5.h),
                                customText(
                                  text: "250",
                                  fontSize: 18.5.sp,
                                  fontWeight: FontWeight.w700,
                                  color: blueColor,
                                  fontFamily: 'inter',
                                ),
                                customText(
                                    text: "gallons today",
                                    fontSize: 15.5.sp,
                                    fontWeight: FontWeight.w500,
                                    color: blackColor,
                                    fontFamily: 'inter',
                                    height: 1.10
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Expanded(
                        child: Column(
                          children: [
                            InkWell(
                              onTap: (){},
                              child: elevatedContainer(
                                vPadding: 2.75.h,
                                hPadding: 5.75.w,
                                containerColor: whiteColor,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        customText(
                                            text: "Pending\nDeliveries",
                                            fontSize: 15.5.sp,
                                            fontWeight: FontWeight.w500,
                                            color: blackColor,
                                            fontFamily: 'inter',
                                            height: 1.10
                                        ),
                                        Spacer(),
                                        Container(
                                            padding: EdgeInsets.all(12.sp),
                                            decoration: BoxDecoration(
                                              color: lightOrangeColor, // light green accent
                                              shape: BoxShape.circle,
                                            ),
                                            child: Transform(
                                                alignment: Alignment.center,
                                                transform: Matrix4.identity()..scale(1.0, -1.0),
                                                child: Image.asset("assets/png/navbar/Mileage-icon.png", height: 2.25.h, color: OrangeColor,))
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 1.5.h),
                                    customText(
                                      text: "3",
                                      fontSize: 18.5.sp,
                                      fontWeight: FontWeight.w700,
                                      color: blueColor,
                                      fontFamily: 'inter',
                                    ),
                                    customText(
                                        text: "0 completed",
                                        fontSize: 15.5.sp,
                                        fontWeight: FontWeight.w500,
                                        color: blackColor,
                                        fontFamily: 'inter',
                                        height: 1.10
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.75.h,),
                  elevatedContainer(
                    hPadding: 5.w,
                    vPadding: 2.5.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(
                          text: "Today's Breakdown",
                          fontWeight: FontWeight.w600,
                          fontSize: 16.5.sp,
                          color: blueColor,
                          fontFamily: "bl_melody"
                        ),
                        SizedBox(height: 2.75.h,),
                        breakDown(title: "Starting Inventory", subTitle: "Beginning of day", quantity: "2000 gal"),
                        Divider(),
                        breakDown(title: "Fuel Delivered", subTitle: "1 completed jobs", quantity: "-250 gal", txtColor: redAppBarColor),
                        Divider(),
                        breakDown(title: "Current Inventory", subTitle: "Available now", quantity: "1750 gal", txtColor: blueColor),
                        Divider(),
                        breakDown(title: "Remaining After Pending", subTitle: "If all jobs are completed", quantity: "1100 gal"),
                      ],
                    )
                  ),
                  SizedBox(height: 1.75.h,),
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