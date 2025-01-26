import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../models/chatSpaceModel.dart';

class RightChatTile extends StatelessWidget {
  final ChatSpaceModel item;
  const RightChatTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // receiver Text message.
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                bottomLeft: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r),
                topRight: Radius.circular(0.r),
              ),
              color: Colors.blue[300]
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Hi john, It nice to meet you.", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15.sp, color: Colors.white),),
          ),
        ),
        SizedBox(width: 4.w),
        // receivers profile image here..
        Container(
          width: 36.w,
          height: 30.h,
          decoration: BoxDecoration(
            color: appGreyColor,
            borderRadius: BorderRadius.circular(50.r),
            /// Show user profile img Here.....
            image: DecorationImage(
                image: AssetImage("assets/images/profileImg.png"),
                fit: BoxFit.fill
            ),
          ),
        ),
      ],
    );
  }
}
