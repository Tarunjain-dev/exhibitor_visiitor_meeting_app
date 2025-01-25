import 'package:exhibitor_visiitor_meeting_app/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VisitorLiveChattingScreen extends StatelessWidget {
  const VisitorLiveChattingScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appBlueColor,
        title: Text("Live Chat", style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: Colors.white),),
      ),

      // Add new chat (FAB)
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // Add new chat and navigation
        },
        backgroundColor: appBlueColor,
        child: Icon(Icons.add_comment_outlined,size: 28.sp, color: Colors.white,),
      ),

      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(left: 12.sp, right: 12.sp, top: 20.sp),
          child: Column(
            children: [
              /// Search Bar.
              SizedBox(
                width: double.infinity,
                height: 40.h,
                child: TextField(
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
                    hintText: "Search to chat...",
                    hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black38, fontSize: 16.sp),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: IconButton(
                          iconSize: 22.sp,
                          onPressed: (){
                            /// logic to search.
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

              /// Chats List
              Expanded(
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 4.sp,bottom: 4.sp),
                      child: Container(
                        width: double.infinity,
                        height: 55.h,
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
                                    child: Text("A", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.white),),
                                  )
                                ],
                              ),
                              SizedBox(width: 10.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 2.h),
                                  Text("Ayushmaan Sahu", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.black),),
                                  SizedBox(height: 2.h),
                                  Text("Hey,How are you?", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal, color: Colors.black),),
                                ],
                              ),
                              Expanded(child: SizedBox(width: 10.w)),
                              Column(
                                children: [
                                  SizedBox(height: 6.h),
                                  Text("12:08 PM", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal, color: Colors.black),),
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
