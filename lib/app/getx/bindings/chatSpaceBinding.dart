import 'package:get/get.dart';

import '../controllers/chatSpaceController.dart';

class ChatSpaceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatSpaceController());
  }
}