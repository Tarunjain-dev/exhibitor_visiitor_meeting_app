import 'package:get/get.dart';

import '../controllers/recentChatController.dart';

class RecentChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecentChatController());
  }
}