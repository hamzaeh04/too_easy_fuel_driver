import 'package:get/get.dart';
import 'package:too_easy_fuel_driver/features/inventory/controller/inventory_controller.dart';

class InventoryBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<InventoryController>(
            () => InventoryController()
    );
  }
}