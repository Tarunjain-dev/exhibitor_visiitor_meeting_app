import 'package:exhibitor_visiitor_meeting_app/app/constants/colors.dart';
import 'package:exhibitor_visiitor_meeting_app/app/screens/visitorPortion/visitorDashboard/home/visitors_home_screen.dart';
import 'package:exhibitor_visiitor_meeting_app/app/screens/visitorPortion/visitorDashboard/liveChat/visitors_live_chat_screen.dart';
import 'package:exhibitor_visiitor_meeting_app/app/screens/visitorPortion/visitorDashboard/profile/visitors_profile_screen.dart';
import 'package:exhibitor_visiitor_meeting_app/app/screens/visitorPortion/visitorDashboard/scheduleNewMeeting/visitors_schedule_new_meeting_screen.dart';
import 'package:exhibitor_visiitor_meeting_app/app/screens/visitorPortion/visitorDashboard/sellerList/seller_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VisitorDashboardBottomNavigation extends StatefulWidget {
  const VisitorDashboardBottomNavigation({super.key});

  @override
  State<VisitorDashboardBottomNavigation> createState() => _VisitorDashboardBottomNavigationState();
}

class _VisitorDashboardBottomNavigationState extends State<VisitorDashboardBottomNavigation> {

  int index = 0;
  final navScreens = [
    VisitorHomeScreen(),
    SellerListScreen(),
    VisitorScheduleNewMeetingScreen(),
    VisitorLiveChattingScreen(),
    VisitorProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navScreens[index],
      bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.white,
          elevation: 8.sp,
          selectedIndex: index,
          indicatorColor: Colors.transparent,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined, size: 24.sp,),
              selectedIcon: Icon(Icons.home_rounded, size: 24.sp,color: Colors.black,),
              label: "Home",
            ),

            NavigationDestination(
              icon: Icon(Icons.groups_2_outlined, size: 24.sp,),
              selectedIcon: Icon(Icons.groups, size: 24.sp, color: Colors.black,),
              label: "Seller List",
            ),

            NavigationDestination(
              // Schedule a new meeting
              label: '',
              icon: Container(
                width: 50.w,
                height: 40.h,
                decoration: BoxDecoration(
                    color: appBlueColor,
                    borderRadius: BorderRadius.circular(50.r)
                ),
                child: Icon(Icons.add_circle_outline_rounded, size: 32.sp, color: Colors.white,),
              ),
            ),

            NavigationDestination(
              icon: Icon(Icons.chat_outlined, size: 24.sp,),
              selectedIcon: Icon(Icons.chat, size: 24.sp, color: Colors.black,),
              label: "Live Chat",
            ),

            NavigationDestination(
              icon: Icon(Icons.person_outline_rounded, size: 24.sp,),
              selectedIcon: Icon(Icons.person, size: 24.sp, color: Colors.black,),
              label: "Profile",
            )
          ]
      ),
    );
  }
}
