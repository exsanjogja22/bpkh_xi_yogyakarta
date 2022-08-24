import 'package:get/get.dart';

import '../controllers/morekepalabalai_controller.dart';

class MorekepalabalaiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MorekepalabalaiController>(
      () => MorekepalabalaiController(),
    );
  }
}
