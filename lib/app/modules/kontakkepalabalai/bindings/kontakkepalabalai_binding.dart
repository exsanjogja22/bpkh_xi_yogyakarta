import 'package:get/get.dart';

import '../controllers/kontakkepalabalai_controller.dart';

class KontakkepalabalaiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KontakkepalabalaiController>(
      () => KontakkepalabalaiController(),
    );
  }
}
