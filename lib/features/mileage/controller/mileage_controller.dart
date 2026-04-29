import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../constants/local_db_key.dart';
import '../../../core/services/shared_prefrences_methods.dart';

class MileageController extends GetxController{
  final TextEditingController startingMileage = TextEditingController();
  final TextEditingController endingMileage = TextEditingController();
  var isLogged = false.obs;
  final prefs = SharedPreferencesMethod.storage;

  @override
  void onInit() {
    super.onInit();
    isLogged.value = prefs.getBool(LocalDBKeys.LOG) == true;
  }

  void startLog(String mileage) {
    prefs.setString(LocalDBKeys.STARTMILEAGE, mileage);
    prefs.setBool(LocalDBKeys.LOG, true);
    isLogged.value = true; // 🔥 triggers UI update instantly
  }
}