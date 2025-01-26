import 'package:exhibitor_visiitor_meeting_app/app/constants/colors.dart';
import 'package:exhibitor_visiitor_meeting_app/app/routes/app_routes.dart';
import 'package:exhibitor_visiitor_meeting_app/app/service/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ExhibitorProfileScreen extends StatefulWidget {
  const ExhibitorProfileScreen({super.key});

  @override
  State<ExhibitorProfileScreen> createState() => _ExhibitorProfileScreenState();
}

class _ExhibitorProfileScreenState extends State<ExhibitorProfileScreen> {

  TextEditingController usernameController = TextEditingController(text: UserStore.to.profile.name);
  TextEditingController emailController = TextEditingController(text: UserStore.to.profile.email);
  TextEditingController phoneNumberController = TextEditingController(text: UserStore.to.profile.phone);
  TextEditingController companyNameController = TextEditingController(text: UserStore.to.profile.companyName);
  TextEditingController companyDescriptionController = TextEditingController(text: UserStore.to.profile.companyDesc);

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    companyNameController.dispose();
    companyDescriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appBlueColor,
        title: Text("User Profile", style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: Colors.white),),
        actions: [
          IconButton(
              onPressed: (){
                Get.toNamed(AppRoutes.editExhibitorProfileRoute);
              },
              icon: Icon(Icons.edit_outlined)
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 12.sp, right: 12.sp, top: 12.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 56.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: appBlueColor, width: 2.sp),
                      image: UserStore.to.profile.profileUrl == ''
                          ? DecorationImage(
                            image: AssetImage("assets/images/profileImg.png"),
                            fit: BoxFit.cover
                          ) : DecorationImage(
                          image: NetworkImage(UserStore.to.profile.profileUrl!),
                          fit: BoxFit.cover
                      ) ,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(UserStore.to.profile.name!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp)),
                      Text(UserStore.to.profile.email!, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14.sp)),
                    ],
                  ),
                  Expanded(child: SizedBox(width: 10.w,)),
                  InkWell(
                    onTap: (){
                      UserStore.to.onLogout();
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
                    },
                    child: Container(
                      height: 34.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        color: Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(Icons.logout_rounded,size: 24.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),

              /// About My Profile
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: appGreyColor,
                      thickness: 2.sp,
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Text("About My Profile", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.grey),),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: Divider(
                      color: appGreyColor,
                      thickness: 2.sp,
                    ),
                  ),
                ],
              ),

              /// Username Field
              Text(" Username", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp, color: Colors.black),),
              TextFormField(
                controller: usernameController,
                enabled: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person,size: 20.sp,color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: Colors.black, width: 1.w),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: appBlueColor, width: 1.w),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: Colors.black, width: 1.w),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: Colors.red, width: 1.w),
                  ),
                  hintText: "John Doe",
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return "Enter Username";
                  }
                  return null;
                },
                onFieldSubmitted: (value) {},
                obscureText: false,
                cursorColor: appBlueColor,
              ),
              SizedBox(height: 10.h),

              /// Email Field
              Text(" Email address", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp, color: Colors.black),),
              TextFormField(
                controller: emailController,
                enabled: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.alternate_email_rounded,size: 20.sp,color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: Colors.black, width: 1.w),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: appBlueColor, width: 1.w),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: Colors.black, width: 1.w),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: Colors.red, width: 1.w),
                  ),
                  hintText: "johdoe@gmail.com",
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return "Enter Email";
                  }
                  return null;
                },
                onFieldSubmitted: (value) {},
                obscureText: false,
                cursorColor: appBlueColor,
              ),
              SizedBox(height: 10.h),

              /// Phone number Field
              Text(" Phone number", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp, color: Colors.black),),
              TextFormField(
                controller: phoneNumberController,
                enabled: false,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone,size: 20.sp,color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: Colors.black, width: 1.w),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: appBlueColor, width: 1.w),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: Colors.black, width: 1.w),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: Colors.red, width: 1.w),
                  ),
                  hintText: "+91 9812345678",
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return "Enter Phone number";
                  }
                  return null;
                },
                onFieldSubmitted: (value) {},
                obscureText: false,
                cursorColor: appBlueColor,
              ),
              SizedBox(height: 10.h),

              /// Company name Field
              Text(" Company Name", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp, color: Colors.black),),
              TextFormField(
                controller: companyNameController,
                enabled: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.work_outline_rounded,size: 20.sp,color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: Colors.black, width: 1.w),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: appBlueColor, width: 1.w),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: Colors.black, width: 1.w),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: Colors.red, width: 1.w),
                  ),
                  hintText: "ABC Industries pvt. ltd.",
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return "Enter Company Name";
                  }
                  return null;
                },
                onFieldSubmitted: (value) {},
                obscureText: false,
                cursorColor: appBlueColor,
              ),
              SizedBox(height: 10.h),

              /// Company description Field
              Text(" Company Description", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp, color: Colors.black),),
              SizedBox(
                height: 100.h,
                child: TextFormField(
                  controller: companyDescriptionController,
                  enabled: false,
                  expands: true,
                  maxLines: null,
                  minLines: null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: Colors.black, width: 1.w),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: appBlueColor, width: 1.w),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: Colors.black, width: 1.w),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: Colors.red, width: 1.w),
                    ),
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Enter Company Description";
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {},
                  obscureText: false,
                  cursorColor: appBlueColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
