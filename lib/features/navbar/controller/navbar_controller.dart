import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import '../../home/views/home_screen.dart';
import '../../inventory/views/inventory_screen.dart';
import '../../job/views/job_screen.dart';
import '../../mileage/views/mileage_screen.dart';
import '../../profile/views/profile_screen.dart';

class NavbarController extends GetxController {
  var selectedIndex = 0.obs;

  List<Widget> get pages => [
    HomeScreen(),
    InventoryScreen(),
    MileageScreen(),
    JobScreen(),
    ProfileScreen(),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }


  final ImagePicker picker = ImagePicker();

  // ✅ correct nullable reactive type
  Rx<Offset> imageOffset = Offset.zero.obs;
  Rxn<XFile> imageFile = Rxn<XFile>();
  Rxn<XFile> imageFile2 = Rxn<XFile>();

  Future<void> pickImage() async {
    final XFile? picked = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (picked != null) {
      if (imageFile.value == null) {
        imageFile.value = picked;
      } else {
        imageFile2.value = picked;
      }
    }
  }

  void clearImage() {
    if (imageFile.value != null) {
      imageFile.value = null;
    } else {
      imageFile2.value = null;
    }
  }
  void clearAllImage() {
    imageFile.value = null;
    imageFile2.value = null;
  }
}
