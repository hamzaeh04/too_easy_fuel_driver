import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel_driver/core/services/shared_prefrences_methods.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/local_db_key.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/background_widget.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/customText_widget.dart';
import '../../../widgets/custom_dialog_widget.dart';
import '../../mileage/controller/mileage_controller.dart';
import '../../setting/widgets/elevated_container.dart';
import '../../setting/widgets/menu_widget.dart';
import '../controller/profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  ProfileScreen({super.key});

  final MileageController mileageController = Get.find<MileageController>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: radialBackground(
        child: Stack(
          children: [
            Column(
              children: [
                // appBar("My Account", isBack: false,),
                appBar("My Account", isBack: false, height: 21.h, padding: 6.5.h),
                SizedBox(height: 3.h,),
                /// Toggle Widget
                Expanded(child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                      children: [
                        SizedBox(height: 6.h,),
                        elevatedContainer(
                          hPadding: 5.w,
                          vPadding: 2.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              customText(
                                text: "John Driver",
                                fontSize: 19.sp,
                                color: blueColor,
                                fontFamily: "bl_melody",
                                fontWeight: FontWeight.bold
                              ),
                              SizedBox(height: 0.20.h,),
                              customText(text: "Driver", fontSize: 15.5.sp,
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 1.75.h,),
                        menu("Edit Profile", color: lightBlueColor, imagePath: "assets/png/faqs.png", vMargin: 0.5.h, ontap: () => Get.toNamed("editprofile")),
                        menu("Help & Support", color: lightPinkColor, imagePath: "assets/png/track_order/help.png", vMargin: 0.5.h, ontap: () => Get.toNamed("helpsupport")),
                        menu("Notification Settings", color: lightOrangeColor, imagePath: "assets/png/track_order/notification.png", vMargin: 0.5.h, ontap: ()=> Get.toNamed("notificationSetting")),

                        SizedBox(height: 3.h,),
                        
                        buttonWidget("Logout", redAppBarColor, colors: redAppBarColor.withValues(alpha: 0.12), onTap: (){
                          // Get.offAllNamed("login");
                          customDialog(context, imgPath: "assets/png/home/alert_icon.png", containerClr: redSharpColor, title: "Are you sure you want to logout?", btnText: "Yes", isButton2: true, btnText2: "No", ontap: (){
                            Get.offAllNamed("login");
                            final prefs = SharedPreferencesMethod.storage;
                            mileageController.isLogged.value = false;
                            prefs.clear();
                            customDialog(context, title: "You’ve been logged out successfully.", ontap: (){
                              Get.back();
                            });
                          });
                        }),
                        SizedBox(height: 5.h,),

                      ],),
                  ),
                ))
              ],
            ),
            Positioned(
                top: 13.25.h,
                left: 0,
                right: 0,
                child: Container(
              height: 14.5.h,
              width: 30.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: blueColor,
                border: Border.all(color: whiteColor, width: 0.05.w)
              ),
                  child: Image.asset("assets/png/profile.png",),
            ))
          ],
        )
      ),
    );
  }

}