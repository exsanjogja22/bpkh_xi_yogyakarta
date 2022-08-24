import 'package:get/get.dart';

import '../controllers/konfirmasiemail_controller.dart';

class KonfirmasiemailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KonfirmasiemailController>(
      () => KonfirmasiemailController(),
    );
  }
}
