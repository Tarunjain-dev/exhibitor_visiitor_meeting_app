import 'package:exhibitor_visiitor_meeting_app/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventMapScreen extends StatelessWidget {
  const EventMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBlueColor,
        title: Text("Event Map", style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: Colors.white),),
      ),
      body: Stack(
        children: [
          InteractiveViewer(
            child: Image.asset("assets/images/IndianMap.jpg", fit: BoxFit.contain,height: double.infinity, width: double.infinity,)),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Text("You can zoom in & out, to explore the map!", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              )),
        ],
      ),
    );
  }
}
