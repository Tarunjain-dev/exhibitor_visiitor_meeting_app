import 'package:exhibitor_visiitor_meeting_app/app/routes/app_routes.dart';
import 'package:exhibitor_visiitor_meeting_app/app/service/firebaseService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode usernameField = FocusNode();
  FocusNode emailField = FocusNode();
  FocusNode passwordField = FocusNode();
  FocusNode confirmPasswordField = FocusNode();

  // Initial Selected "Role" Value
  Rx<String> roleDropDownValue = 'Foreign Visitor'.obs;
  var roles = ["Foreign Visitor", "Indian Exhibitor"];

  RxBool isLoading = false.obs;

  signUp() async {
    if (await FirebaseService.to.handleSignUpByEmail(
      emailController.text,
      passwordController.text,
      usernameController.text,
      phoneController.text,
    )) {
      Get.toNamed(AppRoutes.visitorHomeRoute);
    }
  }
}
