import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel_driver/features/setting/widgets/elevated_container.dart';
import 'package:too_easy_fuel_driver/widgets/button_widget.dart';
import 'package:too_easy_fuel_driver/widgets/custom_dialog_widget.dart';

import '../../../constants/color_constants.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/background_widget.dart';
import '../../../widgets/customText_widget.dart';
import '../../job/controller/job_controller.dart';
import '../controller/home_controller.dart';
import '../widget/job_dialog.dart';
import 'job_detail_screen.dart';

class FuelingScreen extends GetView<HomeController> {
  FuelingScreen({super.key});
  final JobController jobController = Get.find<JobController>();

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
                                    color: greyColor.withValues(alpha: 0.18),
                                    borderRadius: BorderRadius.circular(20.sp)
                                ),
                                child: customText(
                                    text: "FUELING",
                                    color: blueColor,
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
                          child: Center(child: customText(text: "Update Status", color: blueColor, fontSize: 17.5.sp, fontFamily: "bl_melody", fontWeight: FontWeight.w600))
                      ),
                      SizedBox(height: 1.5.h,),
                      elevatedContainer(
                        hPadding: 5.w,
                        vPadding: 2.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText(
                                text: "Delivery Photo",
                                fontSize: 17.5.sp,
                                fontWeight: FontWeight.bold,
                                color: blueColor,
                                fontFamily: "bl_melody"
                            ),
                            SizedBox(height: 2.5.h,),
                            buttonWidget("Upload Delivery Photo", blueColor, borderColor: blueColor, fontsize: 15.sp, onTap: (){
                              jobDialog(context, progressValue: controller.progressValue, title: "Upload Meter Image", imgPath: "assets/png/home/meter.png", isComplete: true);
                            }),
                            SizedBox(height: 2.5.h,),
                            customText(
                                text: "Upload a photo of the fuel meter or equipment as proof of delivery",
                                fontSize: 15.sp,
                                color: darkGreyColor
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 1.5.h,),
                      buttonWidget("Complete Delivery", whiteColor, isGradient: true, fontsize: 15.5.sp, image: Image.asset("assets/png/home/check_outlined_icon.png", width: 4.w,), onTap: (){
                        if(jobController.imageFile.value != null){
                          customDialog(context, title: "Job completed successfully! Fuel inventory updated.", ontap: (){
                            Get.toNamed("navbar");
                            jobController.clearImage();
                          });
                        } else{
                          customDialog(context, imgPath: "assets/png/home/alert_icon.png", title: "Please upload a delivery photo before completing", containerClr: redSharpColor);
                        }
                      }),
                      SizedBox(height: 5.h,),
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
