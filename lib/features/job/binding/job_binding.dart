import 'package:get/get.dart';
import '../controller/job_controller.dart';

class JobBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<JobController>(
            () => JobController()
    );
  }
}