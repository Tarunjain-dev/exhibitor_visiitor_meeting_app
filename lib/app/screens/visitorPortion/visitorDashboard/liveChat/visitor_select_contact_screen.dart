import 'package:exhibitor_visiitor_meeting_app/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../getx/controllers/availableChatController.dart';
import '../../../../models/chatRoomModel.dart';
import '../../../../service/user.dart';

class VisitorSelectContactScreen extends GetView<AvailableChatController> {
  const VisitorSelectContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appBlueColor,
        title: Text("Select Contact", style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 40.h,
              child: TextField(
                controller: controller.searchUserField,
                onChanged: (text){
                  if(text.isEmpty){
                    controller.isSearchUser.value = false;
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black38,width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black38,width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black38,width: 2),
                  ),
                  hintText: "Search to start chat...",
                  hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black38, fontSize: 16.sp),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: IconButton(
                        iconSize: 22.sp,
                        onPressed: (){
                          if(controller.searchUserField.text.isNotEmpty){
                            controller.searchUser();
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.black12),
                        ),
                        icon: Icon(Icons.search_rounded, color: Colors.black38,)
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: Obx(
                    () => controller.isSearchUser.value ? ListView.builder(
                  itemCount: controller.searchUsers.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        String chatRoomId = controller.generateChatRoomId(
                            UserStore.to.userId, controller.users[index].userId!);

                        ChatRoomModel chatRoomModel = ChatRoomModel(
                          users: [UserStore.to.userId, controller.users[index].userId!],
                          usersProfile: [
                            UserStore.to.profile.profileUrl?? '',
                            controller.users[index].profileUrl?? ''
                          ],
                          usersName: [
                            UserStore.to.profile.name?? '',
                            controller.users[index].name?? ''
                          ],
                          lastMessage: "",
                          lastMessageBy: "",
                          lastMessageTm: DateTime.now(),
                          chatRoomId: chatRoomId,
                        );
                        controller.createChatRoom(chatRoomModel, controller.users[index]);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 4.sp,bottom: 4.sp),
                        child: Container(
                          width: double.infinity,
                          height: 65.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: Color(0xffD9D9D9), width: 1.5.sp),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 6.sp,top: 6.sp, right: 8.sp,left: 8.sp),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                        backgroundColor: appBlueColor,
                                        child: controller.searchUsers[index].profileUrl != '' ? Text("A",
                                            style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            )) : Image.network(controller.searchUsers[index].profileUrl!)
                                    )
                                  ],
                                ),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 2.h),
                                    Text(controller.searchUsers[index].name!, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.black),),
                                    SizedBox(height: 2.h),
                                    Text("From: ${controller.searchUsers[index].companyName}", style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.normal, color: Colors.black),),
                                    SizedBox(height: 2.h),
                                    Text("phone no.: ${controller.searchUsers[index].phone}", style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.normal, color: Colors.black),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ) : !controller.isLoading.value ? ListView.builder(
                  itemCount: controller.users.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 4.sp,bottom: 4.sp),
                      child: Container(
                        width: double.infinity,
                        height: 65.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: Color(0xffD9D9D9), width: 1.5.sp),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 6.sp,top: 6.sp, right: 8.sp,left: 8.sp),
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                      backgroundColor: appBlueColor,
                                      child: controller.users[index].profileUrl != '' ? Text("A",
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          )) : Image.network(controller.users[index].profileUrl!)
                                  )
                                ],
                              ),
                              SizedBox(width: 10.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 2.h),
                                  Text(controller.users[index].name!, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.black),),
                                  SizedBox(height: 2.h),
                                  Text("From: ${controller.users[index].companyName}", style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.normal, color: Colors.black),),
                                  SizedBox(height: 2.h),
                                  Text("phone no.: ${controller.users[index].phone}", style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.normal, color: Colors.black),),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ) : CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}