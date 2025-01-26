import 'dart:async';

import 'package:exhibitor_visiitor_meeting_app/app/routes/app_routes.dart';
import 'package:exhibitor_visiitor_meeting_app/app/service/user.dart';
import 'package:get/get.dart';

import '../../models/userModel.dart';

class SplashController extends GetxController{
  void splashServices(){
    Future.delayed(Duration(seconds: 3), ()  {
      if(UserStore.to.isLogin){
        if(UserStore.to.profile.userType == UserType.EXHIBITOR){
          Get.toNamed(AppRoutes.exhibitorHomeRoute);
        } else {
          Get.toNamed(AppRoutes.visitorHomeRoute);
        }
      } else {
        Get.toNamed(AppRoutes.loginRoute);
      }
    });
  }
}