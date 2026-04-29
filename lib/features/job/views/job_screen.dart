import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel_driver/constants/color_constants.dart';
import 'package:too_easy_fuel_driver/features/home/widget/job_container.dart';
import 'package:too_easy_fuel_driver/features/inventory/controller/inventory_controller.dart';
import 'package:too_easy_fuel_driver/features/job/controller/job_controller.dart';
import 'package:too_easy_fuel_driver/features/setting/widgets/elevated_container.dart';
import 'package:too_easy_fuel_driver/widgets/app_bar_widget.dart';
import 'package:too_easy_fuel_driver/widgets/background_widget.dart';

import '../../../widgets/customText_widget.dart';
import '../../../widgets/custom_dialog_widget.dart';

class JobScreen extends GetView<JobController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: radialBackground(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appBar("Jobs", isBack: false),
          Expanded(child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w,),
              child: Column(
                children: [
                  SizedBox(height: 4.h,),
                  Container(
                    height: 6.h,
                    decoration: BoxDecoration(
                      color: notificationGreyColor,
                      borderRadius: BorderRadius.circular(8.w),
                      boxShadow: [
                        BoxShadow(
                          color: blackColor.withOpacity(0.08), // soft shadow
                          blurRadius: 10,
                          offset: Offset(0, 4), // slight lift
                        ),
                      ],
                      border: Border.all(
                        color: greyColor.withValues(alpha: 0.4), // subtle edge
                      ),
                    ),
                    child: Obx(() {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 0.5.h),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  controller.isSelected.value = !controller.isSelected.value;
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: controller.isSelected.value
                                          ? whiteColor
                                          : notificationGreyColor,
                                      borderRadius: BorderRadius.circular(8.w),
                                      border: Border.all(color: controller.isSelected.value
                                          ? greyColor.withValues(alpha: 0.3)
                                          : notificationGreyColor)
                                  ),
                                  child: Center(
                                    child: customText(
                                      text: "Active Jobs (2)",
                                      fontSize: 14.5.sp,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 0), // remove spacing between buttons if needed
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  controller.isSelected.value = !controller.isSelected.value;
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: controller.isSelected.value
                                          ? notificationGreyColor
                                          : whiteColor,
                                      borderRadius: BorderRadius.circular(8.w),
                                      border: Border.all(color: controller.isSelected.value
                                          ? notificationGreyColor
                                          : greyColor.withValues(alpha: 0.25),)
                                  ),
                                  child: Center(
                                    child: customText(
                                      text: "Completed (1)",
                                      fontSize: 14.5.sp,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 2.h,),
                  Obx((){
                    return controller.isSelected.value == true ?
                    Column(
                      children: [
                        jobContainer(title: "Green Valley Farms", location: "North Field", time: "11:30 AM", quantity: "500 gal", isJobScreen: true, btnText: "Fueling Up", ontap: (){
                          Get.toNamed("jobdetail");
                        }),
                        SizedBox(height: 1.5.h,),
                        jobContainer(title: "Metro Transport Inc.", location: "Central Depot", time: "02:00 PM", quantity: "150 gal", isJobScreen: true, btnText: "Fueling Up", child: Row(children: [tag(title: "DEF Fluid")],), ontap: (){
                          Get.toNamed("jobdetail");
                        }),
                      ],
                    ): Column(
                      children: [
                        jobContainer(title: "ABC Construction Co.", location: "Downtown Site", time: "09:00 AM", quantity: "250 gal", isJobScreen: true, btnText: "Completed", ontap: (){
                            customDialog(context, width: 75.w, title: "Job completed successfully! Fuel inventory updated.", ontap: (){
                              Get.back();
                            });
                        }),
                        SizedBox(height: 1.5.h,),
                        jobContainer(title: "Metro Transport Inc.", location: "Central Depot", time: "02:00 PM", quantity: "150 gal", isJobScreen: true, btnText: "Fueling Up", child: Row(children: [tag(title: "Oil Change"), SizedBox(width: 2.w,), tag(title: "Filter Replacement")],), ontap: (){
                          customDialog(context, width: 75.w, title: "Job completed successfully! Fuel inventory updated.", ontap: (){
                            Get.back();
                          });
                        }),
                      ],
                    );
                  })
                ],
              )
            ),
          ))
        ],
      )),
    );
  }
}