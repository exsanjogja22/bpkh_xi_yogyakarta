import 'package:get/get.dart';

import '../controllers/detailpengajuan_controller.dart';

class DetailpengajuanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailpengajuanController>(
      () => DetailpengajuanController(),
    );
  }
}
