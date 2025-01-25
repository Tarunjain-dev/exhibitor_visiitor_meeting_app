import 'package:exhibitor_visiitor_meeting_app/app/constants/colors.dart';
import 'package:exhibitor_visiitor_meeting_app/app/screens/auth/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  LoginController loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailField = FocusNode();
  FocusNode passwordField = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailField.dispose();
    passwordField.dispose();
  }

  // Login function to handel user SignIn process
  void login(){
    if(_formKey.currentState!.validate()){
      // login backend codes here...
      loginController.login(
        userEmail: emailController.text.toString(),
        userPassword: passwordController.text.toString(),
      );
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
                        // Email Text field
                        Text(" Email", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp, color: Colors.black),),
                        TextFormField(
                          controller: emailController,
                          focusNode: emailField,
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
                            FocusScope.of(context).requestFocus(passwordField);
                          },
                          obscureText: false,
                          cursorColor: appBlueColor,
                        ),
                        SizedBox(height: 10.h),

                        // Password Text field
                        Text(" Password", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp, color: Colors.black),),
                        TextFormField(
                          controller: passwordController,
                          focusNode: passwordField,
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

                        // Forgot Password
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                              onTap: (){
                                // Forgot Password Functionality here...
                                Get.toNamed("/forgotPassword");
                              },
                              child: Text("Forgot Password?", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: appBlueColor))),
                        ),
                        SizedBox(height: 20.h),

                        // SignIn Button
                        Obx(
                          ()=> SizedBox(
                            height: 40.h,
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: ()=> login(),
                                style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(Color(0xff5782BB)),
                                ),
                                child: loginController.isLoading.value ? Center(child: CircularProgressIndicator(color: Colors.white)) :
                                Text("Sign In", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp, color: Colors.white),)
                            ),
                          ),
                        ),
                        SizedBox(height: 12.h),

                        // Don't have an account? button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.black)),
                            InkWell(
                              onTap: (){
                                // Navigate to SignUp Screen
                                Get.toNamed("/signup");
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
