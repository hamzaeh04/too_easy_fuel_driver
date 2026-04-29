import 'dart:ui';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class JobController extends GetxController{
  RxBool isSelected = true.obs;

  final ImagePicker picker = ImagePicker();

  // ✅ correct nullable reactive type
  Rx<Offset> imageOffset = Offset.zero.obs;
  Rxn<XFile> imageFile = Rxn<XFile>();

  Future<void> pickImage() async {
    final XFile? picked = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (picked != null) {
      if (imageFile.value == null) {
        imageFile.value = picked;
      }
    }
  }

  void clearImage() {
    if (imageFile.value != null) {
      imageFile.value = null;
    }
  }
}