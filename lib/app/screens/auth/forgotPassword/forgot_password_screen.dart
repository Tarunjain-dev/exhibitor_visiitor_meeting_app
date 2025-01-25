import 'package:exhibitor_visiitor_meeting_app/app/constants/colors.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
        backgroundColor: appBlueColor,
      ),
      body: Center(child: Text("Forgot password Screen")),
    );
  }
}
