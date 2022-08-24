import 'package:get/get.dart';

import '../controllers/statistik_controller.dart';

class StatistikBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatistikController>(
      () => StatistikController(),
    );
  }
}
