import 'package:get/get.dart';

import '../controllers/loginpegawai_controller.dart';

class LoginpegawaiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginpegawaiController>(
      () => LoginpegawaiController(),
    );
  }
}
