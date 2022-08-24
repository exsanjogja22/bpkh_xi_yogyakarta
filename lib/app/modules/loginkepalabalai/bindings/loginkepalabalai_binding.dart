import 'package:get/get.dart';

import 'package:bpkh_xi_yogyakarta/app/modules/loginkepalabalai/controllers/token_controller.dart';

import '../controllers/loginkepalabalai_controller.dart';

class LoginkepalabalaiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TokenController>(
      () => TokenController(),
    );
    Get.lazyPut<LoginkepalabalaiController>(
      () => LoginkepalabalaiController(),
    );
  }
}
