import 'package:get/get.dart';

import '../controllers/homekepalabalai_controller.dart';

class HomekepalabalaiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomekepalabalaiController>(
      () => HomekepalabalaiController(),
    );
  }
}
