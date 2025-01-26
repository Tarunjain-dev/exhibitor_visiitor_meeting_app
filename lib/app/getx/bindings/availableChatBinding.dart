import 'package:get/get.dart';

import '../controllers/availableChatController.dart';

class AvailableChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AvailableChatController());
  }
}