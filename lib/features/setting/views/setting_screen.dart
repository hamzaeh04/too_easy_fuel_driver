import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/color_constants.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/background_widget.dart';
import '../controller/setting_controller.dart';
import '../widgets/menu_widget.dart';


class SettingScreen extends GetView<SettingController> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: radialBackground(
        child: Column(
          children: [
            appBar("Help & Support"),
            SizedBox(height: 3.h,),
            menu("About Us", imagePath: "assets/png/about.png", color: lightGreenColor, ontap: (){
              Get.toNamed('aboutus');
            }, hMargin: 5.w),
            SizedBox(height: 1.5.h,),
            menu("Help & Support", imagePath: "assets/png/support.png", color: lightYellowColor, ontap: (){
              Get.toNamed('support');
            }, hMargin: 5.w),
            SizedBox(height: 1.5.h,),
            menu("Terms & Conditions", imagePath: "assets/png/about.png",  color: lightGreenColor, ontap: (){
              Get.toNamed('terms');
            }, hMargin: 5.w),
            SizedBox(height: 1.5.h,),
            menu("FAQs", imagePath: "assets/png/faqs.png",  color: lightBlueColor, ontap: (){
              Get.toNamed('faqs');
            }, hMargin: 5.w),
          ],
        ),
      ),
    );
  }

}
