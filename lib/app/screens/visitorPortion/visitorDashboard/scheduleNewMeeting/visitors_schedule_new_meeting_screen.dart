import 'package:exhibitor_visiitor_meeting_app/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VisitorScheduleNewMeetingScreen extends StatefulWidget {
  const VisitorScheduleNewMeetingScreen({super.key});

  @override
  State<VisitorScheduleNewMeetingScreen> createState() => _VisitorScheduleNewMeetingScreenState();
}

class _VisitorScheduleNewMeetingScreenState extends State<VisitorScheduleNewMeetingScreen> {

  bool isLoading = false;
  String selectedExhibitor = "Select an Exhibitor";
  String selectedDateOfMeeting = "Select day of your meeting";
  var exhibitors = [
    "Select an Exhibitor",
    "exhibitor 1",
    "exhibitor 2",
    "exhibitor 3",
    "exhibitor 4",
    "exhibitor 5",
    "exhibitor 6"
  ];

  var days = [
    "Select day of your meeting",
    "Day 1 : 04.May.2025",
    "Day 2 : 05.May.2025",
    "Day 3 : 06.May.2025",
  ];

  // start time of the day variable storage
  TimeOfDay startTimeOfMeeting = TimeOfDay.now();
  TimeOfDay endTimeOfMeeting = TimeOfDay.now();

  // scheduleNewMeeting() Method here...
  void scheduleNewMeeting(){}

  // Select Start Time Function
  Future<void> selectStartTime()async {
    TimeOfDay? pickedStartTime = await showTimePicker(
        context: context,
        initialTime: startTimeOfMeeting
    );
    if(pickedStartTime != null){
      startTimeOfMeeting = pickedStartTime;
    }
  }

  // Select End Time Function
  Future<void> selectEndTime()async {
    TimeOfDay? pickedEndTime = await showTimePicker(
        context: context,
        initialTime: endTimeOfMeeting
    );
    if(pickedEndTime != null){
      endTimeOfMeeting = pickedEndTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appBlueColor,
        title: Text("Schedule New Meeting", style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: Colors.white),),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Select an Exhibitor: Drop Down option
            Text("Select an Exhibitor", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp, color: Colors.black),),
            Text("(Choose an exhibitor to schedule a new meeting)", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13.sp, color: Colors.black),),
            SizedBox(height: 4.h),
            Container(
              height: 50.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: Colors.black, width: 1)
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: selectedExhibitor,
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: exhibitors.map((String index) {
                    return DropdownMenuItem(
                      value: index,
                      child: Text(index),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedExhibitor = newValue!;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Padding(
              padding: EdgeInsets.only(left: 2.w, right: 2.w),
              child: Text("Note: If the exhibitor's name is not listed, it means they have not created an account", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13.sp, color: Colors.black),),
            ),
            SizedBox(height: 10.h),

            /// Day of Meeting: Drop Down option
            Text("Day of Meeting", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp, color: Colors.black),),
            Text("(Set the day of your meeting)", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13.sp, color: Colors.black),),
            SizedBox(height: 4.h),
            Container(
              height: 50.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: Colors.black, width: 1)
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: selectedDateOfMeeting,
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: days.map((String index) {
                    return DropdownMenuItem(
                      value: index,
                      child: Text(index),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedDateOfMeeting = newValue!;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 10.h),

            /// Start time of Meeting: Drop Down option
            Text("Start Time of Meeting", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp, color: Colors.black),),
            Text("(Set the start time of your meeting)", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13.sp, color: Colors.black),),
            SizedBox(height: 4.h),
            /// time picker 1 here
            SizedBox(
              height: 30.h,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: (){
                    /// Start time of the day backend logic here...
                    selectStartTime();
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                      side: WidgetStatePropertyAll(BorderSide(color: Colors.black38))
                  ),
                  child: Text("Set Start Time", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp, color: Colors.black38),)
              ),
            ),
            SizedBox(height: 10.h),

            /// Start time of Meeting: Drop Down option
            Text("End Time of Meeting", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp, color: Colors.black),),
            Text("(Set the end time of your meeting)", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13.sp, color: Colors.black),),
            SizedBox(height: 4.h),
            /// time picker 2 here...
            SizedBox(
              height: 30.h,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: (){
                    /// End time of the day backend logic here...
                    selectEndTime();
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                    side: WidgetStatePropertyAll(BorderSide(color: Colors.black38))
                  ),
                  child: Text("Set End Time", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp, color: Colors.black38),)
              ),
            ),
            SizedBox(height: 50.h),

            /// Schedule Meeting Button.
            SizedBox(
              height: 40.h,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: ()=> scheduleNewMeeting(),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Color(0xff5782BB)),
                  ),
                  child: isLoading? Center(child: CircularProgressIndicator(color: Colors.white)) :
                  Text("Schedule the Meeting", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp, color: Colors.white),)
              ),
            ),
            SizedBox(height: 12.h),

          ],
        ),
      ),
    );
  }
}
