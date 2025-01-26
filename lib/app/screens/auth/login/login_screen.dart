import 'package:exhibitor_visiitor_meeting_app/app/constants/colors.dart';
import 'package:exhibitor_visiitor_meeting_app/app/routes/app_routes.dart';
import 'package:exhibitor_visiitor_meeting_app/app/screens/auth/login/getx/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  void login() async{
    if(_formKey.currentState!.validate()) {
      controller.login();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30.h),
                  Text("Welcome Back!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34.sp, color: Colors.black),),
                  Text("Signing to your account", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14.sp, color: Colors.black),),
                  SizedBox(height: 20.h),
                  Image.asset("assets/images/app_logo.png", width: 210.w, height: 180.h, fit: BoxFit.cover),
                  SizedBox(height: 20.h),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(" Email", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp, color: Colors.black),),
                        TextFormField(
                          controller: controller.emailController,
                          focusNode: controller.emailField,
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
                            hintText: "johdoe@gmail.com",
                          ),
                          validator: (value) {
                            if(value!.isEmpty){
                              return "Enter Email";
                            }
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(controller.passwordField);
                          },
                          obscureText: false,
                          cursorColor: appBlueColor,
                        ),
                        SizedBox(height: 10.h),

                        // Password Text field
                        Text(" Password", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp, color: Colors.black),),
                        TextFormField(
                          controller: controller.passwordController,
                          focusNode: controller.passwordField,
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
                            hintText: "password (6 digits min.)",
                          ),
                          validator: (value) {
                            if(value!.isEmpty){
                              return "Enter Password";
                            }
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).unfocus();
                          },
                          obscureText: false,
                          cursorColor: appBlueColor,
                        ),
                        SizedBox(height: 8.h),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                              onTap: (){
                                Get.toNamed(AppRoutes.forgotPasswordRoute);
                              },
                              child: Text("Forgot Password?", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: appBlueColor))),
                        ),
                        SizedBox(height: 20.h),
                        SizedBox(
                            height: 40.h,
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: ()=> login(),
                                style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(Color(0xff5782BB)),
                                ),
                                child: Obx(
                                  () => controller.isLoading.value
                                      ? Center(child: CircularProgressIndicator(color: Colors.white))
                                      : Text("Sign In", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp, color: Colors.white),),
                                )
                            ),
                          ),
                        SizedBox(height: 12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.black)),
                            InkWell(
                              onTap: (){
                                Get.toNamed(AppRoutes.signupRoute);
                              },
                              child: Text(" SignUp", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: appBlueColor)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
