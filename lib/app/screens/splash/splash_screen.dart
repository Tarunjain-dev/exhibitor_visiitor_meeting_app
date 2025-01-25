import 'package:exhibitor_visiitor_meeting_app/app/constants/colors.dart';
import 'package:exhibitor_visiitor_meeting_app/app/screens/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashController splashController = Get.put(SplashController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashController.splashServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appYellowColor,
      body: Center(
        child: Image.asset("assets/images/app_logo.png", width: 210.w, height: 210.h, fit: BoxFit.cover,),
      ),
    );
  }
}
