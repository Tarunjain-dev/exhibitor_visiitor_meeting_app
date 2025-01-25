import 'package:exhibitor_visiitor_meeting_app/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditVisitorProfileScreen extends StatefulWidget {
  const EditVisitorProfileScreen({super.key});

  @override
  State<EditVisitorProfileScreen> createState() => _EditVisitorProfileScreenState();
}

class _EditVisitorProfileScreenState extends State<EditVisitorProfileScreen> {

  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController companyDescriptionController = TextEditingController();
  FocusNode usernameField = FocusNode();
  FocusNode emailField = FocusNode();
  FocusNode phoneNumberField = FocusNode();
  FocusNode companyNameField = FocusNode();
  FocusNode companyDescriptionField = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    usernameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    companyNameController.dispose();
    companyDescriptionController.dispose();
    usernameField.dispose();
    emailField.dispose();
    phoneNumberField.dispose();
    companyNameField.dispose();
    companyDescriptionField.dispose();
  }

  // Update & Save Changes Function here...
  void saveChanges(){
    if(_formKey.currentState!.validate()){
      /// backend logic here...
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBlueColor,
        title: Text("Edit User Profile", style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: Colors.white),),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 12.sp, right: 12.sp, top: 12.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User Profile : See & Edit profile image
                Center(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                        height: 110.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: appBlueColor, width: 2.sp),
                          image: DecorationImage(
                              image: AssetImage("assets/images/profileImg.png"),
                              fit: BoxFit.cover
                          ),
                        ),
                                        ),
                      ),
                      Positioned(
                        left: 100.w,
                        top: 93.h,
                        child: CircleAvatar(
                          backgroundColor: appBlueColor,
                          child: Icon(Icons.camera_alt_outlined,color: Colors.white,),
                        ),
                      )
                    ],
                  ),
                ),

                // TextFields
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
                            prefixIcon: Icon(Icons.person_outline_rounded),
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
                            prefixIcon: Icon(Icons.email_outlined),
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
                            FocusScope.of(context).requestFocus(phoneNumberField);
                          },
                          obscureText: false,
                          cursorColor: appBlueColor,
                        ),
                        SizedBox(height: 10.h),

                        // Phone Number : Text field
                        Text(" Phone number", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp, color: Colors.black),),
                        TextFormField(
                          controller: phoneNumberController,
                          focusNode: phoneNumberField,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone_outlined),
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
                              return "Enter phone number";
                            }
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(companyNameField);
                          },
                          obscureText: false,
                          cursorColor: appBlueColor,
                        ),
                        SizedBox(height: 10.h),

                        // Company name : Text field
                        Text(" Company name", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp, color: Colors.black),),
                        TextFormField(
                          controller: companyNameController,
                          focusNode: companyNameField,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.business),
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
                            hintText: "ABC Industries Pvt. Lmt.",
                          ),
                          validator: (value) {
                            if(value!.isEmpty){
                              return "Enter company name";
                            }
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(companyDescriptionField);
                          },
                          obscureText: false,
                          cursorColor: appBlueColor,
                        ),
                        SizedBox(height: 10.h),

                        // Company description : Text field
                        Text(" Company Description", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp, color: Colors.black),),
                        SizedBox(
                          height: 100.h,
                          child: TextFormField(
                            controller: companyDescriptionController,
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
                        SizedBox(height: 10.h),
                      ],
                    ),
                ),

                // Update & Save Changes Button
                SizedBox(
                  height: 46.h,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: ()=> saveChanges(),
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Color(0xff5782BB)),
                      ),
                      child: isLoading? Center(child: CircularProgressIndicator(color: Colors.white)) :
                      Text("Update & Save Changes", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp, color: Colors.white),)
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
