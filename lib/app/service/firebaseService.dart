
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exhibitor_visiitor_meeting_app/app/service/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/chatRoomModel.dart';
import '../models/userModel.dart';

class FirebaseService extends GetxController {
  static FirebaseService get to => Get.find();
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationId = '';

  Future<void> addUser(UserModel user) async {
    await fireStore.collection("Users").doc(user.userId).set(user.toJson());
  }

  Future<UserModel?> getUser(String userId) async {
    final doc = await fireStore.collection("Users").doc(userId).get();
    return doc.exists ? UserModel.fromJson(doc.data()!) : null;
  }

  Stream<QuerySnapshot> getAllUsers() {
    return fireStore
        .collection("Users")
        .where("userId", isNotEqualTo: UserStore.to.userId)
        .snapshots();
  }

  Future<bool> handleSignInByEmail(String email, String password) async {
    UserModel? userModel;
    try {
      UserCredential userValue = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      userModel = await getUser(userValue.user!.uid);
      await UserStore.to.saveProfile(userModel!.userId ?? '');
      return true;
    } catch (e) {
      log('$e Occurred');
      Get.snackbar("Authentication", e.toString());
      return false;
    }
  }

  Future<bool> handleSignUpByEmail(String email, String password,
      String username, String phoneNumber) async {
    UserModel? userModel;
    try {
      UserCredential userValue = await auth.createUserWithEmailAndPassword(email: email, password: password);
      if(userValue.user != null){
        userModel = UserModel(
            userId: userValue.user!.uid,
            name: username,
            email: email,
            password: password,
            phone: phoneNumber,
            companyDesc: '',
            companyName: '',
            profileUrl: '',
            role: '',
            qrId: '',
            stallNo: '',
            userType: UserType.VISITOR
        );
        await addUser(userModel);
        await UserStore.to.saveProfile(userModel.userId ?? '');
        return true;
      }else{
        return false;
      }

    } catch (e) {
      Get.snackbar("Authentication", e.toString());
      log('$e Occurred');
      return false;
    }
  }



  Future<void> updateMessage(Map<String, dynamic> lastMessage, String chatRoomId) async {
    return await fireStore
        .collection('chats')
        .doc(chatRoomId)
        .update(lastMessage);
  }

  Future<void> sendMessage(
      Map<String, dynamic> messageContent, String chatRoomId) async {
    return await fireStore
        .collection('chats')
        .doc(chatRoomId)
        .collection("chatList")
        .doc()
        .set(messageContent);
  }

  Stream<QuerySnapshot> readMessage(String docId) {
    return fireStore
        .collection("chats")
        .doc(docId)
        .collection("chatList")
        .orderBy("messageTm", descending: false)
        .snapshots();
  }

  Stream<QuerySnapshot> getChatRoom() {
    return fireStore
        .collection("chats")
        .where("users", arrayContains: UserStore.to.userId)
        .where("lastMessage", isNotEqualTo: '')
        .orderBy("lastMessage", descending: false)
        .orderBy("lastMessageTm", descending: true)
        .snapshots();
  }

  Future<void> createChatRoom(ChatRoomModel chatRoom) async {
    final doc = await fireStore.collection("chats").doc(chatRoom.chatRoomId).get();
    if (!doc.exists) {
      await fireStore
          .collection("chats")
          .doc(chatRoom.chatRoomId)
          .set(chatRoom.toJson());
    }
  }
}
