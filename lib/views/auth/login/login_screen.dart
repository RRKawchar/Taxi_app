import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_app/views/auth/login/componets/login_widget.dart';
import 'package:taxi_app/views/auth/login/componets/primary_widget.dart';
import 'package:taxi_app/views/auth/otp_verification/otp_verification_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  final countryPicker = const FlCountryCodePicker();
  CountryCode countryCode =
      const CountryCode(name: 'Bangladesh', code: 'BD', dialCode: '+880');

  onSubmit(String? input){
  Get.to(()=>OtpVerificationScreen(phoneNumber:countryCode.dialCode+input!,));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              primaryWidget(),
              const SizedBox(
                height: 50,
              ),
              loginWidget(
                countryCode: countryCode,
                onTap: () async {
                  final code = await countryPicker.showPicker(context: context);
                  if (code != null) countryCode = code;
                  setState(() {});
                },

                onSubmitted: onSubmit
              )
            ],
          ),
        ),
      ),
    );
  }
}
