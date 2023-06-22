import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_app/controller/auth_controller.dart';
import 'package:taxi_app/views/auth/login/componets/primary_widget.dart';
import 'package:taxi_app/views/auth/otp_verification/componets/otp_back_button.dart';
import 'package:taxi_app/views/auth/otp_verification/componets/otp_verification_widget.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phoneNumber;

  const OtpVerificationScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  AuthController authController=Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    authController.phoneAuth(widget.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                primaryWidget(),
                Positioned(
                  top: 50,
                  left: 20,
                  child: OtpBackButton(
                    onTap: () {
                      Get.back();
                    },
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            otpVerificationWidget()
          ],
        ),
      ),
    );
  }
}


