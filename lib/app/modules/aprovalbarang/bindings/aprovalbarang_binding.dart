import 'package:get/get.dart';

import '../controllers/aprovalbarang_controller.dart';

class AprovalbarangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AprovalbarangController>(
      () => AprovalbarangController(),
    );
  }
}
