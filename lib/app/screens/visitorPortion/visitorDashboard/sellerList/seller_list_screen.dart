import 'package:exhibitor_visiitor_meeting_app/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SellerListScreen extends StatelessWidget {
  const SellerListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appBlueColor,
        title: Text("Sellers List", style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: Colors.white),),
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
                    hintText: "Search a seller here...",
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

              /// Sellers list.
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
                                    child: Text("S", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.white),),
                                  ),
                                ],
                              ),
                              SizedBox(width: 10.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 2.h),
                                  Text("Sellers name", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.black),),
                                  SizedBox(height: 2.h),
                                  Text("+91 9812345678", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal, color: Colors.black),),
                                ],
                              ),
                              Expanded(child: SizedBox(width: 10.w)),
                              Column(
                                children: [
                                  SizedBox(height: 4.h),
                                  Icon(Icons.keyboard_arrow_down_rounded,size: 20.sp, color: Colors.black,)
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
