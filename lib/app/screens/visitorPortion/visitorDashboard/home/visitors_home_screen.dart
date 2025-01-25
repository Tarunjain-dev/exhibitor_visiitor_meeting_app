import 'package:exhibitor_visiitor_meeting_app/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VisitorHomeScreen extends StatelessWidget {
  const VisitorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // Event Map (FAB)
      floatingActionButton: SizedBox(
        width: 110.w,
        height: 38.h,
        child: FloatingActionButton(
          onPressed: (){
            // Display Event Map..
            Get.toNamed("/eventMap");
          },
          backgroundColor: appBlueColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.map_rounded,size: 24, color: Colors.white,),
              SizedBox(width: 4.w),
              Text("Event Map", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp,color: Colors.white)),
            ],
          ),
        ),
      ),

      // Body
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(left: 12.sp, right: 12.sp, top: 20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// upperMostRow: profile image, username, email, camera and QR code button
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 56.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: appBlueColor, width: 2.sp),
                      image: DecorationImage(
                          image: AssetImage("assets/images/profileImg.png"),
                          fit: BoxFit.cover
                      ),
                    ),

                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello John", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp)),
                      Text("johndoe@gmail.com", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14.sp)),
                    ],
                  ),
                  Expanded(child: SizedBox(width: 10.w,)),
                  InkWell(
                    onTap: (){
                      /// Scan QR Code From here....

                    },
                    child: Container(
                      height: 34.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        color: Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(Icons.camera_alt_outlined,size: 24.sp),
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  InkWell(
                    onTap: (){
                      /// Show user's QR Code From here....
                      Get.defaultDialog(
                        backgroundColor: Colors.white,
                        title: "QR Code",
                        titleStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
                        content: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.w, right: 8.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Hey John,", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14.sp)),
                                Text("Here your unique QR Code.", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp)),
                                SizedBox(height: 8.h),
                                // QR code Image here...
                                Center(
                                  child: Container(
                                      height: 180.h, width: 220.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.r),
                                        border: Border.all(color: Colors.grey,width: 3.sp),
                                        image: DecorationImage(
                                            image: AssetImage("assets/images/sampleQR.png"),
                                            fit: BoxFit.fill
                                        ),
                                      ),
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Center(child: Text("( Show this QR Code to verify )", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp))),
                                SizedBox(height: 10.h),
                                // Okay Button
                                SizedBox(
                                  height: 30.h,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      onPressed: ()=>Get.back(),
                                      style: ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(Color(0xff5782BB)),
                                      ),
                                      child: Text("Okay", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp, color: Colors.white),)
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )

                      );
                    },
                    child: Container(
                      height: 34.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        color: Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(Icons.qr_code_scanner_rounded,size: 24.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),

              /// Date & Day Container
              Container(
                width: double.infinity,
                height: 60.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Color(0xffD9D9D9)
                ),
                child: Row(
                  children: [
                    // 4th may
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: appBlueColor,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.r), topLeft: Radius.circular(10.r)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Day 1 : Sun", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp , color: appYellowColor)),
                            SizedBox(height: 4.h),
                            Text("04.May.25", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14.sp , color: appYellowColor)),
                          ],
                        ),
                      ),
                    ),

                    // 5th may
                    Expanded(
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Day 2 : Mon", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp , color: appBlueColor)),
                            SizedBox(height: 4.h),
                            Text("05.May.25", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14.sp , color: appBlueColor)),
                          ],
                        ),
                      ),
                    ),

                    //6th may
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.r), topRight: Radius.circular(10.r)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Day 3 : Tue", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp , color: appBlueColor)),
                            SizedBox(height: 4.h),
                            Text("06.May.25", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14.sp , color: appBlueColor)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),

              /// Meetings of the day
              Text(" Meetings of the day", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp)),
              Expanded(
                child: ListView.builder(

                  itemCount: 10,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 4.sp,bottom: 4.sp),
                      child: Container(
                        width: double.infinity,
                        height: 80.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: Color(0xffD9D9D9), width: 1.5.sp),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 6.sp,top: 6.sp, right: 8.sp,left: 8.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(" Meeting Name", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp)),
                                  SizedBox(height: 6.h),
                                  Row(
                                    children: [
                                      Icon(Icons.storefront,size: 20.sp,),
                                      SizedBox(width: 2.w,),
                                      Text(" Stall no.: 009", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14.sp)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.watch_later_outlined,size: 20.sp,),
                                      SizedBox(width: 2.w,),
                                      Text(" 12:00PM to 02:00PM", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14.sp)),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(width: 10.w),
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: Color(0xffD9D9D9),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(6.sp),
                                      child: Text(" Starts in 1h.20m", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12.sp)),
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  IconButton(
                                    onPressed: (){
                                      // Start meeting button
                                    },
                                    style: ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(Color(0xff5782BB))
                                    ),
                                    icon: Icon(Icons.play_circle_outline,size: 30.sp, color: Colors.white,),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
