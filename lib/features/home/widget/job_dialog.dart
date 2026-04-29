import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel_driver/features/job/controller/job_controller.dart';
import 'package:too_easy_fuel_driver/features/navbar/controller/navbar_controller.dart';
import '../../../constants/color_constants.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/customText_widget.dart';

Future<void> jobDialog(BuildContext context, {String? title, String? imgPath, VoidCallback? ontap, VoidCallback? ontapCancel, required RxDouble progressValue, bool? isComplete = false}) {
  final JobController jobController = Get.find<JobController>();
  return showDialog(
    barrierDismissible: false, // 👈 THIS IS THE KEY FIX
    context: context,
    builder: (context) {
      return Dialog(

          backgroundColor: whiteColor,
          child: SizedBox(
            width: 85.w,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.5.w, vertical: 2.5.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // important to avoid full height
                    children: [
                      Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // ClipRRect(
                            //   borderRadius: BorderRadius.circular(14.sp),
                            //   child: Container(
                            //     height: 17.5.h,
                            //     width: 40.w,
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(14.sp),
                            //       color: blueColor,
                            //     ),
                            //     child: Obx(() {
                            //       return navbarController.imageFile.value != null
                            //           ? Image.file(
                            //         File(navbarController.imageFile.value!.path),
                            //         fit: BoxFit.cover,
                            //       )
                            //           : Image.asset(
                            //         imgPath ?? "assets/png/check_icon.png",
                            //         fit: BoxFit.cover,
                            //       );
                            //     })
                            //   ),
                            // ),

                            Obx(() {
                              final file = jobController.imageFile.value;

                              return GestureDetector(
                                  onPanUpdate: (details) {
                                    final offset = jobController.imageOffset.value + details.delta;

                                    jobController.imageOffset.value = Offset(
                                      offset.dx.clamp(-100, 100),
                                      offset.dy.clamp(-100, 100),
                                    );
                                  },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(14.sp),
                                  child: Transform.translate(
                                    offset: jobController.imageOffset.value,
                                    child: Transform.scale(
                                      scale: 1 + (progressValue.value * 2), // 👈 zoom control

                                      child: Container(
                                        height: 17.5.h,
                                        width: 40.w,
                                        child: file != null
                                            ? Image.file(
                                          File(file.path),
                                          fit: BoxFit.cover,
                                        )
                                            : Image.asset(
                                          imgPath ?? "assets/png/check_icon.png",
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    ),
                                  ),
                                ),
                              );
                            }),

                            /// GRID
                            Positioned.fill(
                              child: Image.asset(
                                "assets/png/home/img.png",
                                fit: BoxFit.cover,
                              ),
                            ),

                            /// OVERLAY WITH CUTOUT CIRCLE
                            Positioned.fill(
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                  whiteColor.withValues(alpha: 0.3),
                                  BlendMode.srcOut,
                                ),
                                child: Stack(
                                  children: [
                                    /// full overlay
                                    Container(
                                      decoration: BoxDecoration(
                                        color: whiteColor,
                                        backgroundBlendMode: BlendMode.dstOut,
                                      ),
                                    ),

                                    /// transparent circle (hole)
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        height: 15.5.h,
                                        width: 15.5.h,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ),
                      SizedBox(height: 2.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (){
                              jobController.pickImage();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.75.h),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: greyColor.withValues(alpha: 0.35)),
                                color: whiteColor, // needed so shadow is visible
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.08),
                                    blurRadius: 6,
                                    spreadRadius: 1,
                                    offset: Offset(0, 2), // slight downward shadow
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                "assets/png/auth_image/camera_icon.png",
                                color: blueColor,
                                width: 5.5.w,
                              ),
                            ),
                          ),
                          SizedBox(width: 1.w,),

                          customText(
                              textAlign: TextAlign.center,
                              text: title ?? "Upload Profile Image",
                          ),
                          SizedBox(width: 0.5.w,),
                          customText(
                            text: "*",
                            color: redColor
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h,),
                      Obx(() => progress(
                        value: progressValue.value,
                        onChanged: (v) => progressValue.value = v,
                      )),
                      SizedBox(height: 2.h,),
                      buttonWidget("Done", whiteColor, isGradient: true, onTap: ontap ?? (){
                        Get.back();
                        isComplete == false ?
                        jobController.clearImage(): null;
                        jobController.imageOffset.value = Offset.zero;
                        progressValue.value = 0;
                      },fontsize: 15.sp),

                    ],
                  ),
                ),
                // Positioned(top: 1.h, right: 2.5.w, child: InkWell(
                //     onTap: ontapCancel ?? (){
                //       Get.back();
                //       navbarController.clearImage();
                //       navbarController.imageOffset.value = Offset.zero;
                //       progressValue.value = 0;
                //     },
                //     child: Icon(Icons.cancel_outlined,))
                // )
              ],
            ),
          )
      );
    },
  );
}
Widget progress({
  required double value,
  required Function(double) onChanged,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 5.w),
    child: LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;

        return GestureDetector(
          onHorizontalDragUpdate: (details) {
            double dx = details.localPosition.dx;
            double newValue = dx / maxWidth;

            onChanged(newValue.clamp(0.0, 1.0));
          },
          child: SizedBox(
            height: 4.h, // 👈 IMPORTANT: give space for circle overflow
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                /// Background Track
                Center(
                  child: Container(
                    height: 1.25.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                /// Progress Fill
                Center(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 1.25.h,
                      width: maxWidth * value,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [lightGreenColor, darkGreenClr],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),

                /// Circle Handle (FLOATING ABOVE)
                Positioned(
                  left: (maxWidth * value) - 10,
                  child: Container(
                    width: 2.25.h,
                    height: 2.25.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        center: Alignment.center,
                        radius: 0.5,
                        colors: [
                          darkGreenClr,    // middle → outer (dark)
                          lightGreenColor, // center (light)
                        ],
                        stops: [0.2, 1.0],
                      ),
                      border: Border.all(
                        color: whiteColor,
                        width: 0.6.w,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 6,
                          color: Colors.black26,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}