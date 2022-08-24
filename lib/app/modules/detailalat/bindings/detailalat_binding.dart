import 'package:get/get.dart';

import '../controllers/detailalat_controller.dart';

class DetailalatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailalatController>(
      () => DetailalatController(),
    );
  }
}
