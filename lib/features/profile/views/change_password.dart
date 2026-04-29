import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';


import '../../../constants/color_constants.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/background_widget.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/custom_dialog_widget.dart';
import '../../../widgets/custom_text_feild.dart';
import '../controller/profile_controller.dart';

class ChangePasswordScreen extends GetView<ProfileController> {
  const ChangePasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: radialBackground(
        child: Column(
          children: [
            // appBar("My Account", isBack: false,),
            appBar("Change Password",),
            SizedBox(height: 3.h,),
            /// Toggle Widget
            Expanded(child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  children: [
                    customTextField("Current Password", "Enter password", path: "assets/png/auth_image/field-icons-password.png", isPass: true, isObscure: controller.isObscure),
                    SizedBox(height: 1.25.h,),
                    customTextField("New Password", "Enter New Password", path: "assets/png/auth_image/field-icons-password.png", isPass: true, isObscure: controller.isObscure),
                    SizedBox(height: 1.25.h,),
                    customTextField("Confirm Password", "Enter Confirm New Password", path: "assets/png/auth_image/field-icons-password.png", isPass: true, isObscure: controller.isObscure),
                    SizedBox(height: 3.5.h,),
                    buttonWidget("Update", whiteColor, isGradient: true, onTap: (){
                      customDialog(context, containerClr: blueColor, title: "Password has been updated successfully", ontap: (){
                        Get.toNamed("profile");
                      });
                    })
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

}
