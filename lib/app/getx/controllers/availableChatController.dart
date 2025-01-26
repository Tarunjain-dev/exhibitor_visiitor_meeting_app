
import 'dart:developer';

import 'package:get/get.dart';

import '../../models/userModel.dart';
import '../../service/firebaseService.dart';
import '../../service/user.dart';

class AvailableChatController extends GetxController{

  RxList<UserModel> users = <UserModel>[].obs;
  final myUserId = UserStore.to.userId;
  var isLoading = true.obs;

  loadUsers() async {
    isLoading.value = true;
    users.value = [];
    log('Fetching user data');
    var usersData = FirebaseService.to.getAllUsers();
    log('Fetching user data complete');
    usersData.listen((userSnapshot) {
      log('UserList: ');
      for (var userElement in userSnapshot.docs) {
        log('UserList: ${userElement.data()}');
        users.add(
            UserModel.fromJson(userElement.data() as Map<String, dynamic>));
      }
    });
    isLoading.value = false;
  }

}