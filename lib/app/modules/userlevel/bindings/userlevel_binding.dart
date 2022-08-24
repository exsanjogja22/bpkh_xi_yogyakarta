import 'package:get/get.dart';

import '../controllers/userlevel_controller.dart';

class UserlevelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserlevelController>(
      () => UserlevelController(),
    );
  }
}
