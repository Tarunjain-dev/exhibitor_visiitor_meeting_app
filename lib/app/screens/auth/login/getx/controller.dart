
import 'package:exhibitor_visiitor_meeting_app/app/service/firebaseService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/userModel.dart';
import '../../../../routes/app_routes.dart';
import '../../../../service/user.dart';

class LoginController extends GetxController{

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  FocusNode emailField = FocusNode();

  FocusNode passwordField = FocusNode();

  RxBool isLoading = false.obs;

  login() async {
    if(await FirebaseService.to.handleSignInByEmail(emailController.text, passwordController.text)){
      if(UserStore.to.profile.userType == UserType.EXHIBITOR){
        Get.toNamed(AppRoutes.exhibitorHomeRoute);
      }else{
        Get.toNamed(AppRoutes.visitorHomeRoute);
      }
    }
  }
}