import 'package:get/get.dart';

import '../controllers/formstransaksi_controller.dart';

class FormstransaksiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormstransaksiController>(
      () => FormstransaksiController(),
    );
  }
}
