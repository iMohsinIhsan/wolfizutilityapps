import 'package:get/get.dart';

import '../controllers/milk_home_controller.dart';

class MilkHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MilkHomeController>(
      () => MilkHomeController(),
    );
  }
}
