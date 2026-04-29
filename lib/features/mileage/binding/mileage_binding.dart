import 'package:get/get.dart';
import 'package:too_easy_fuel_driver/features/inventory/controller/inventory_controller.dart';

import '../controller/mileage_controller.dart';

class MileageBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<MileageController>(
            () => MileageController()
    );
  }
}