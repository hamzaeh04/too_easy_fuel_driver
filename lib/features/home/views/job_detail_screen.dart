import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel_driver/features/setting/widgets/elevated_container.dart';
import 'package:too_easy_fuel_driver/widgets/button_widget.dart';

import '../../../constants/color_constants.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/background_widget.dart';
import '../../../widgets/customText_widget.dart';
import '../controller/home_controller.dart';

class JobDetailScreen extends GetView<HomeController> {
  JobDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: radialBackground(
        child: Column(
          children: [
            appBar("Back to Jobs", ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    children: [
                      SizedBox(height: 3.h,),
                      elevatedContainer(
                        hPadding: 5.w,
                        vPadding: 1.75.h,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText(
                                    text: "Metro Transport Inc.",
                                    fontSize: 18.5.sp,
                                    fontWeight: FontWeight.bold,
                                    color: blueColor,
                                    fontFamily: "bl_melody"
                                ),
                                customText(
                                    text: "Central Depot",
                                    fontSize: 15.25.sp,
                                    fontWeight: FontWeight.w400,
                                    color: blackColor,
                                ),
                              ],
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 0.75.h),
                              decoration: BoxDecoration(
                                  color: greyColor.withValues(alpha: 0.20),
                                  borderRadius: BorderRadius.circular(20.sp)
                              ),
                              child: customText(
                                  text: "Pending",
                                  color: darkGreyColor,
                                  fontSize: 14.5.sp
                              ),
                            )
                          ],
                        )
                      ),
                      SizedBox(height: 1.5.h,),
                      elevatedContainer(
                        hPadding: 5.w,
                        vPadding: 2.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText(
                                text: "Order Details",
                                fontSize: 18.5.sp,
                                fontWeight: FontWeight.bold,
                                color: blueColor,
                                fontFamily: "bl_melody"
                            ),
                            orderDetails(key: "Order#:", value: "12345"),
                            orderDetails(key: "Customer:", value: "Customer"),
                            orderDetails(key: "Location:", value: "Lorem ipsum dolor sit amet."),
                            orderDetails(key: "Fuel Type:", value: "Diesel"),
                            orderDetails(key: "Quantity:", value: "10.5 Gallon"),
                            orderDetails(key: "Date:", value: "Tue, 14 Dec"),
                            orderDetails(key: "Delivery Time:", value: "02:26 PM"),
                          ],
                        )
                      ),
                      SizedBox(height: 1.5.h,),
                      elevatedContainer(
                          hPadding: 5.w,
                          vPadding: 2.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(
                                  text: "Mileage Reading",
                                  fontSize: 18.5.sp,
                                  fontWeight: FontWeight.bold,
                                  color: blueColor,
                                  fontFamily: "bl_melody"
                              ),
                              orderDetails(key: "Start of Ride:", value: "1234567"),
                              orderDetails(key: "End of Ride:", value: "1234590"),
                              orderDetails(key: "Total Mileage:", value: "30"),

                            ],
                          )
                      ),
                      SizedBox(height: 1.5.h,),
                      elevatedContainer(
                          hPadding: 5.w,
                          vPadding: 2.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(
                                  text: "Update Status",
                                  fontSize: 17.5.sp,
                                  fontWeight: FontWeight.bold,
                                  color: blueColor,
                                  fontFamily: "bl_melody"
                              ),
                              SizedBox(height: 2.5.h,),
                              buttonWidget("Start Job", whiteColor, isGradient: true, onTap: (){
                                Get.toNamed("jobstarted");
                              })
                            ],
                          )
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
Widget orderDetails({String? key, String? value}){
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 0.45.h),
    child: Row(
      children: [
        customText(
          text: key,
          fontSize: 15.5.sp,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(width: 2.w,),
        customText(
          text: value,
          fontSize: 15.5.sp,
          fontWeight: FontWeight.w400,
        ),
      ],
    ),
  );
}