import 'package:exhibitor_visiitor_meeting_app/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  var isLoading = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode usernameField = FocusNode();
  FocusNode emailField = FocusNode();
  FocusNode passwordField = FocusNode();
  FocusNode confirmPasswordField = FocusNode();

  // Initial Selected "Role" Value
  String roleDropDownValue = 'Foreign Visitor';
  var roles = ["Foreign Visitor", "Indian Exhibitor"];

  // Signup function to handel user registration
  void signup() {
    if(_formKey.currentState!.validate()){
      if(passwordController.text.toString().trim() == confirmPasswordController.text.toString().trim()){
        // Signup user with there email-password and store their credentials in fireStore database.

      }else{
        // password and confirm password is not matching
        Get.snackbar("Credentials not matching!", "Either password or confirm-password is incorrect.");
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    usernameField.dispose();
    emailField.dispose();
    passwordField.dispose();
    confirmPasswordField.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10.h),
                  Text("Create an account", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34.sp, color: Colors.black),),
                  Text("Register to Global Connect", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14.sp, color: Colors.black),),
                  SizedBox(height: 30.h),

                  Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Username : Text field
                          Text(" Username", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp, color: Colors.black),),
                          TextFormField(
                            controller: usernameController,
                            focusNode: usernameField,
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
                              hintText: "John Doe",
                            ),
                            validator: (value) {
                              if(value!.isEmpty){
                                return "Enter Username";
                              }
                              return null;
                            },
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(emailField);
                            },
                            obscureText: false,
                            cursorColor: appBlueColor,
                          ),
                          SizedBox(height: 10.h),

                          // Email : Text field
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
                              hintText: "johndoe@gmail.com",
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

                          // Password : Text field
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
                                return "Enter password";
                              }
                              return null;
                            },
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(confirmPasswordField);
                            },
                            obscureText: false,
                            cursorColor: appBlueColor,
                          ),
                          SizedBox(height: 10.h),

                          // Confirm Password : Text field
                          Text(" Confirm Password", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp, color: Colors.black),),
                          TextFormField(
                            controller: confirmPasswordController,
                            focusNode: confirmPasswordField,
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
                                return "Please confirm password";
                              }
                              return null;
                            },
                            onFieldSubmitted: (value) {},
                            obscureText: false,
                            cursorColor: appBlueColor,
                          ),
                          SizedBox(height: 10.h),

                          // Role Selection : Drop Down Field
                          Text(" Select Role", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp, color: Colors.black),),
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
                                value: roleDropDownValue,
                                isExpanded: true,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: roles.map((String index) {
                                  return DropdownMenuItem(
                                    value: index,
                                    child: Text(index),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    roleDropDownValue = newValue!;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                        ],
                      )
                  ),

                  // signup Button
                  SizedBox(
                      height: 46.h,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: ()=> signup(),
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(Color(0xff5782BB)),
                          ),
                          child: isLoading ? Center(child: CircularProgressIndicator(color: Colors.white)) :
                          Text("Register", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp, color: Colors.white),)
                      ),
                    ),

                  SizedBox(height: 12.h),

                  // Already have an account? button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.black)),
                      InkWell(
                        onTap: (){
                          // Navigate back to login Screen
                          Get.back();
                        },
                        child: Text(" SignIn", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: appBlueColor)),
                      ),
                    ],
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
