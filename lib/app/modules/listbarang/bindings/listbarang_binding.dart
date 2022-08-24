import 'package:get/get.dart';

import '../controllers/listbarang_controller.dart';

class ListbarangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListbarangController>(
      () => ListbarangController(),
    );
  }
}
