import 'package:get/get.dart';

import '../controllers/infopeminjam_controller.dart';

class InfopeminjamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InfopeminjamController>(
      () => InfopeminjamController(),
    );
  }
}
