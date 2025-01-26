
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../models/chatRoomModel.dart';
import '../../models/userModel.dart';
import '../../routes/app_routes.dart';
import '../../service/firebaseService.dart';
import '../../service/user.dart';

class AvailableChatController extends GetxController{

  TextEditingController searchUserField = TextEditingController();
  RxList<UserModel> users = <UserModel>[].obs;
  RxList<UserModel> searchUsers = <UserModel>[].obs;
  final myUserId = UserStore.to.userId;
  var isLoading = true.obs;
  RxBool isSearchUser = false.obs;

  @override
  Future<void> onInit() async {
    await loadUsers();
    super.onInit();
  }

  loadUsers() {
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

  Future<void> searchUser() async {
    searchUsers.clear();
    var usersData = FirebaseService.to.searchUsers(searchUserField.text);
    log('Fetching user data complete');
    usersData.listen((userSnapshot) {
      log('UserList: ');
      for (var userElement in userSnapshot.docs) {
        log('UserList: ${userElement.data()}');
        searchUsers.add(
            UserModel.fromJson(userElement.data() as Map<String, dynamic>));
      }
    });
    isSearchUser.value = true;
  }

  createChatRoom(ChatRoomModel chatRoomModel, UserModel otherUser) async {
    await FirebaseService.to.createChatRoom(chatRoomModel);
    if(UserStore.to.profile.userType == UserType.EXHIBITOR) {
      Get.toNamed(AppRoutes.exhibitorChatSpaceScreen, parameters: {
        "chatRoomId": chatRoomModel.chatRoomId!,
        "toUserProfile": otherUser.profileUrl ?? '',
        "toUserName": otherUser.name ?? '',
        "toUserUid": otherUser.userId ?? ''
      });
    } else {
      Get.toNamed(AppRoutes.visitorChatSpaceScreen, parameters: {
        "chatRoomId": chatRoomModel.chatRoomId!,
        "toUserProfile": otherUser.profileUrl ?? '',
        "toUserName": otherUser.name ?? '',
        "toUserUid": otherUser.userId ?? ''
      });
    }
  }

  generateChatRoomId(String myUserUid, String otherUserId) {
    if (myUserUid.substring(0, 1).codeUnitAt(0) >
        otherUserId.substring(0, 1).codeUnitAt(0)) {
      return "$otherUserId\_$myUserUid";
    } else {
      return "$myUserUid\_$otherUserId";
    }
  }
}