
import 'package:exhibitor_visiitor_meeting_app/app/models/userModel.dart';
import 'package:exhibitor_visiitor_meeting_app/app/service/firebaseService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController{

  RxBool isLoading = false.obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController companyDescriptionController = TextEditingController();
  FocusNode usernameField = FocusNode();
  FocusNode emailField = FocusNode();
  FocusNode phoneNumberField = FocusNode();
  FocusNode companyNameField = FocusNode();
  FocusNode companyDescriptionField = FocusNode();

  updateProfile() async {
    isLoading.value = true;
    await FirebaseService.to.updateUser(UserModel(
      name: usernameController.text,
      phone: phoneNumberController.text,
      email: emailController.text,
      companyName: companyNameController.text,
      companyDesc: companyDescriptionController.text,
    ));
    isLoading.value = false;
    Get.back();
  }
}