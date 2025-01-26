import 'package:exhibitor_visiitor_meeting_app/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../getx/controllers/chatSpaceController.dart';
import '../../../../widgets/left_chat_tile.dart';
import '../../../../widgets/right_chat_tile.dart';

class ExhibitorChatSpaceScreen extends GetView<ChatSpaceController> {
  const ExhibitorChatSpaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appBlueColor,
        leading: Padding(
          padding: EdgeInsets.only(bottom: 8.h, top: 6.h, right: 6.w,left: 8.w),
          child: Container(
            width: 30.w,
            height: 30.h,
            decoration: BoxDecoration(
              color: appGreyColor,
              borderRadius: BorderRadius.circular(50.r),
              image: controller.toUserProfile.value != ''
                  ? DecorationImage(
                  image: NetworkImage(controller.toUserProfile.value),
                  fit: BoxFit.fill
              ) : DecorationImage(
                  image: AssetImage("assets/images/profileImg.png"),
                  fit: BoxFit.fill
              ),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(controller.toUserName.value, style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: Colors.white),),
            Text("Last seen today at 08:26AM", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal, color: Colors.white),),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Chat room ui here...
              Text("Wed, 08:21AM", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal, color: Colors.black),),
              SizedBox(height: 4.h),
              Expanded(
                child: Obx(
                      () => Container(
                    padding: EdgeInsets.only( bottom: 15.h),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      reverse: true,
                      itemCount: controller.chatData.length,
                      itemBuilder: (context, index){
                        var item = controller.chatData[index];
                        if(controller.toUserUid.value == item.sendBy){
                          return RightChatTile(item : item);
                        }
                        return LeftChatTile(item: item);
                      },
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 250.w,
                      height: 40.h,
                      child: TextField(
                        controller: controller.textController,
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
                          hintText: "Type Something...",
                          hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black38, fontSize: 16.sp),
                        ),
                      ),
                    ),
                  ),

                  // sending button..
                  IconButton(
                    onPressed: (){
                      controller.sendMessage();
                    },
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(appBlueColor)
                    ),
                    icon: Icon(Icons.send, color: Colors.white, size: 20.sp,),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}