import 'dart:async';

import 'package:get/get.dart';

class SplashController extends GetxController{
  void splashServices(){
    // navigate user from splashScreen to either loginScreen or there particular dashBoards.
    Timer(Duration(seconds: 3), () => Get.toNamed("/login"),);
  }
}