import 'dart:developer';

import 'package:exhibitor_visiitor_meeting_app/app/routes/app_routes.dart';
import 'package:exhibitor_visiitor_meeting_app/app/service/storage.dart';
import 'package:get/get.dart';

import '../models/userModel.dart';
import 'firebaseService.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  final _isLogin = false.obs;
  String userId = '';
  String userIdKey = 'userIdKey';
  String userNameKey = 'userNameKey';
  String userProfilePicKey = 'userProfilePicKey';
  String userEmailKey = 'userEmailKey';
  final _profile = UserModel().obs;

  bool get isLogin => _isLogin.value;
  UserModel get profile => _profile.value;
  bool get hasToken => userId.isNotEmpty;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getProfile();
  }

  Future<void> setToken(String value) async {
    await StorageService.to.setString(userIdKey, value);
    userId = value;
  }

  Future<void> getProfile() async {
    userId = StorageService.to.getString(userIdKey);
    if (userId.isNotEmpty) {
      _profile(await FirebaseService.to.getUser(userId));
    }
    log('user data: $userId');
    _isLogin.value = true;
  }

  Future<void> saveProfile(String profile) async {
    await StorageService.to.setString(userIdKey, profile);
    await getProfile();
    userId = profile;
    log("data is saved: ${_profile.value}");
  }

  Future<void> onLogout() async {
    await StorageService.to.remove(userEmailKey);
    await StorageService.to.remove(userIdKey);
    await StorageService.to.remove(userProfilePicKey);
    await StorageService.to.remove(userNameKey);
    _isLogin.value = false;
    userId = '';
    Get.offAllNamed(AppRoutes.loginRoute);
  }
}
