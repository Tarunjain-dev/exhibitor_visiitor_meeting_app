
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exhibitor_visiitor_meeting_app/app/routes/app_routes.dart';
import 'package:get/get.dart';

import '../../models/chatRoomModel.dart';
import '../../models/userModel.dart';
import '../../service/firebaseService.dart';
import '../../service/user.dart';

class RecentChatController extends GetxController{
  RxList<ChatRoomModel> chatRoomList = <ChatRoomModel>[].obs;
  RxList<UserModel> otherUser = <UserModel>[].obs;
  var index = 0.obs;
  RxList<UserModel> users = <UserModel>[].obs;
  final myUserId = UserStore.to.userId;
  var isLoading = true.obs;

  @override
  Future<void> onInit() async {
    asyncLoadData();
    super.onInit();
  }

  asyncLoadData() async {
    isLoading.value = true;
    var RoomList = FirebaseService.to.getChatRoom();
    RoomList.listen((snapshot) async {
      isLoading.value = true;
      log('Loading');
      for (var chatRoom in snapshot.docChanges) {
        switch (chatRoom.type) {
          case DocumentChangeType.added:
            if (chatRoom.doc.data() != null) {
              Map<String, dynamic> chatRoomData = chatRoom.doc.data() as Map<String, dynamic>;
              chatRoomList.add(
                  ChatRoomModel.fromJson(chatRoomData)
              );
              if(chatRoomData['users'][0] == myUserId){
                otherUser.add(
                    (await FirebaseService.to.getUser(chatRoomData['users'][1]))!
                );
              }else{
                otherUser.add(
                    (await FirebaseService.to.getUser(chatRoomData['users'][0]))!
                );
              }
            }
            break;
          case DocumentChangeType.modified:
            if (chatRoom.doc.data() != null) {
              log('This is the change: ${chatRoom.doc.data()}');
              Map<String, dynamic> chatRoomData = chatRoom.doc.data() as Map<String, dynamic>;
              int changeIndex = chatRoomList.indexWhere((element) => element.chatRoomId == chatRoomData['chatRoomId']);
              chatRoomList[changeIndex] = chatRoomList[changeIndex].copyWith(
                lastMessage: chatRoomData['lastMessage'],
                lastMessageBy: chatRoomData['lastMessageBy'],
                lastMessageTm: DateTime.parse(chatRoomData['lastMessageTm']),
              );
              log('This is update: $chatRoomList');
            }
            break;
          case DocumentChangeType.removed:
            break;
        }
      }
      isLoading.value = false;
      log('Loading completed');
    }, onError: (error) => log("Listening failed: $error"));
  }

  createChatRoom(ChatRoomModel chatRoomModel, UserModel otherUser) async {
    await FirebaseService.to.createChatRoom(chatRoomModel);
    Get.toNamed(AppRoutes.chatScreen, parameters: {
      "chatRoomId": chatRoomModel.chatRoomId!,
      "toUserProfile": otherUser.profileUrl?? '',
      "toUserName": otherUser.name?? '',
      "toUserUid": otherUser.userId?? ''
    });
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