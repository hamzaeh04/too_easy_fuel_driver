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

class EditProfileScreen extends GetView<ProfileController> {
  const EditProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: radialBackground(
          child: Column(
            children: [
              // appBar("My Account", isBack: false,),
              appBar("Edit Profile",),
              SizedBox(height: 3.h,),
              /// Toggle Widget
              Expanded(child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    children: [
                      customTextField("Full Name", "John Smith", path: "assets/png/auth_image/field-icons-user.png", isObscure: controller.isObscure),
                      SizedBox(height: 1.25.h,),
                      customTextField("Email", "john.smith@example.com", path: "assets/png/auth_image/field-icons-email.png", isObscure: controller.isObscure),
                      SizedBox(height: 1.25.h,),
                      customTextField("Phone Number", "(555) 123-4567", path: "assets/png/track_order/phone.png", isObscure: controller.isObscure),
                      SizedBox(height: 1.25.h,),
                      customTextField("Default Address", "Enter your default address", path: "assets/png/track_order/location.png", isObscure: controller.isObscure),
                      SizedBox(height: 3.5.h,),
                      buttonWidget("Save Changes", whiteColor, isGradient: true, onTap: (){
                        customDialog(context, containerClr: blueColor, title: "Profile has been updated successfully", ontap: (){
                          Get.toNamed("navbar");
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