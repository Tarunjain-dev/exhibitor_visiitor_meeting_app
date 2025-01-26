import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../models/chatSpaceModel.dart';
import '../../service/firebaseService.dart';



class ChatSpaceController extends GetxController{
  var _isLoading = true.obs;
  RxList<ChatSpaceModel> chatData = <ChatSpaceModel>[].obs;
  var toUserProfile = ''.obs;
  var toUserName = ''.obs;
  var toUserDescription =''.obs;
  var toUserUid = ''.obs;
  var chatRoomId = ''.obs;

  /* This is the getter */
  get isLoading => _isLoading.value;

  /* This is the setter */
  set isLoading(value) {
    _isLoading = value;
  }

  final textController = TextEditingController();
  final msgScrolling = ScrollController();
  FocusNode contentNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
    var chatData = Get.parameters;
    chatRoomId.value = chatData['chatRoomId']?? '';
    toUserProfile.value = chatData['toUserProfile']?? '';
    toUserName.value = chatData['toUserName']?? '';
    toUserUid.value = chatData['toUserId']?? '';
  }

  sendMessage() async {
    String sendContent = textController.text.trim();
    textController.clear();
    if(sendContent != ''){
      final content = ChatSpaceModel(
        message: sendContent,
        sendBy: toUserUid.value,
        messageTm: DateTime.now(),
      );
      await FirebaseService.to.sendMessage(content.toJson(), chatRoomId.value).then((value) {
        Get.focusScope?.unfocus();
      });
      log(content.messageTm!.toIso8601String());
      await FirebaseService.to.updateMessage(
          {
            "lastMessage": sendContent.trim(),
            "lastMessageBy": toUserUid.value,
            "lastMessageTm": content.messageTm!.toIso8601String()
          },
          chatRoomId.value
      );
    }
  }

  @override
  void onReady() {
    super.onReady();
    var messages = FirebaseService.to.readMessage(chatRoomId.value);
    chatData.clear();
    messages.listen((snapshot) {
      for (var change in snapshot.docChanges) {
        switch (change.type) {
          case DocumentChangeType.added :
            if (change.doc.data() != null) {
              chatData.insert(
                0,
                ChatSpaceModel.fromJson(change.doc.data() as Map<String, Object?>),
              );
            }
            break;
          case DocumentChangeType.modified: break;
          case DocumentChangeType.removed: break;
          }
      }
    },onError: (error) => log("Listening failed: $error"));

    Iterable inReverse = chatData.reversed;
    chatData.value = inReverse.toList() as List<ChatSpaceModel>;
  }

  @override
  void dispose() {
    msgScrolling.dispose();
    super.dispose();
  }
}