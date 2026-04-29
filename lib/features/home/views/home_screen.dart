import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/color_constants.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/background_widget.dart';
import '../../../widgets/customText_widget.dart';
import '../../navbar/controller/navbar_controller.dart';
import '../../setting/widgets/elevated_container.dart';
import '../controller/home_controller.dart';
import '../widget/job_container.dart';
import '../widget/track_order_widget.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});
  final NavbarController navbarController = Get.find<NavbarController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: radialBackground(
        child: Column(
          children: [
            appBar("Josh elbert", isHome: true),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    children: [
                      SizedBox(height: 2.h),
                      elevatedContainer(
                          hPadding: 5.w,
                          vPadding: 2.h,
                          gradient: LinearGradient(
                            colors: [lightBlueColor, Color(0xFFEFF6FF)],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  customText(
                                    text: "Order #: 12345",
                                    fontSize: 18.5.sp,
                                    fontWeight: FontWeight.w700,
                                    color: blueColor
                                  ),
                                  Spacer(),
                                  customText(
                                    text: "Tue, 14 Dec",
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500
                                  ),
                                ],
                              ),
                              SizedBox(height: 1.h,),
                              customText(
                                  text: "Quantity: 10.5 Gallons",
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500
                              ),
                              SizedBox(height: 0.5.h,),

                              customText(
                                  text: "Current Status: Order Received",
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500
                              ),

                              SizedBox(height: 2.h,),
                              trackOrderWidget(title: "Order Received", subTitle: "In progress...", imgPath: "assets/png/track_order/check_container.png", step: true,),
                              trackOrderWidget(title: "Fuel on the Way", imgPath: "assets/png/track_order/way.png",),
                              trackOrderWidget(title: "Fueling Up", imgPath: "assets/png/track_order/fueling.png",),
                              trackOrderWidget(title: "Completed", imgPath: "assets/png/track_order/check.png", isLast: true),
                            ],
                          )
                      ),
                      SizedBox(height: 1.5.h),

                      // Fleet Management
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: (){},
                              child: elevatedContainer(
                                vPadding: 2.h,
                                hPadding: 5.75.w,
                                gradient: LinearGradient(
                                  colors: [lightBlueColor, Color(0xFFEFF6FF)],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
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
                                              color: neonLightBlueColor, // light green accent
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset("assets/png/navbar/Inventory-icon.png", height: 2.25.h, color: neonBlueColor,)
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 1.20.h),
                                    // customText(
                                    //   text: "2000",
                                    //   fontSize: 18.5.sp,
                                    //   fontWeight: FontWeight.w700,
                                    //   color: blueColor,
                                    //   fontFamily: 'inter',
                                    // ),
                                    // customText(
                                    //     text: "gallons available",
                                    //     fontSize: 15.5.sp,
                                    //     fontWeight: FontWeight.w500,
                                    //     color: blackColor,
                                    //     fontFamily: 'inter',
                                    //     height: 1.10
                                    // ),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            customText(
                                                text: "Diesel: ",
                                                fontSize: 15.5.sp,
                                                fontWeight: FontWeight.w500,
                                                color: blueColor,
                                                fontFamily: 'inter',
                                            ),
                                            customText(
                                                text: "Premium: ",
                                                fontSize: 15.5.sp,
                                                fontWeight: FontWeight.w500,
                                                color: blueColor,
                                                fontFamily: 'inter',
                                            ),
                                            customText(
                                                text: "Normal: ",
                                                fontSize: 15.5.sp,
                                                fontWeight: FontWeight.w500,
                                                color: blueColor,
                                                fontFamily: 'inter',
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 1.w,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,

                                          children: [
                                            customText(
                                                text: "1500 G",
                                                fontSize: 15.5.sp,
                                                fontWeight: FontWeight.w500,
                                                color: blackColor,
                                                fontFamily: 'inter',
                                            ),
                                            customText(
                                                text: "800 G",
                                                fontSize: 15.5.sp,
                                                fontWeight: FontWeight.w500,
                                                color: blackColor,
                                                fontFamily: 'inter',
                                            ),
                                            customText(
                                                text: "3000 G",
                                                fontSize: 15.5.sp,
                                                fontWeight: FontWeight.w500,
                                                color: blackColor,
                                                fontFamily: 'inter',
                                            ),
                                          ],
                                        )
                                      ],
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
                                    gradient: LinearGradient(
                                      colors: [parrotGreenColor, offWhiteGradColor],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            customText(
                                                text: "Today's\nJobs",
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
                                                  color: neonGreenColor.withValues(alpha: 0.20), // light green accent
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.asset("assets/png/navbar/Jobs-icon.png", height: 2.25.h, color: neonGreenColor,)
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
                      SizedBox(height: 2.25.h),
                      Row(
                        children: [
                          customText(
                            text: "Today's Jobs",
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: blueColor,
                            fontFamily: "bl_melody"
                          ),
                          Spacer(),
                          InkWell(
                            onTap: (){
                              navbarController.changeIndex(3);
                            },
                            child: customText(
                                text: "View All",
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: redAppBarColor,
                              txtDecoration: TextDecoration.underline,
                              decorationColor: redAppBarColor
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.5.h),
                      
                      jobContainer(title: "ABC Construction Co.", btnText: "Fueling Up", location: "Downtown Site", time: "09:00 AM", quantity: "250 gal (Diesel)", isContinue: true, child: Row(
                        children: [
                         tag(title: "Oil Change"),
                          SizedBox(width: 3.w,),
                          tag(title: "Filter Replacement"),
                        ],
                      ), ontap: () => Get.toNamed("jobdetail")),
                      SizedBox(height: 1.5.h),
                      jobContainer(title: "Green Valley Farms", btnText: "Pending", location: "North Field", time: "11:30 AM", quantity: "500 gal (Diesel)", ontap: () => Get.toNamed("jobdetail")),
                      SizedBox(height: 1.5.h),
                      jobContainer(title: "Metro Transport Inc.", btnText: "Pending", location: "Central Depot", time: "02:00 AM", quantity: "150 gal (Gasoline)", child: Row(
                        children: [
                          tag(title: "DEF Fluid"),
                        ],
                      ), ontap: () => Get.toNamed("jobdetail")),
                      SizedBox(height: 4.h),
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
