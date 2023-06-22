import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi_app/utils/my_constants.dart';
import 'package:taxi_app/views/auth/otp_verification/componets/pintput_widget.dart';
import 'package:taxi_app/views/auth/otp_verification/otp_verification_screen.dart';
import 'package:taxi_app/widgets/custom_text.dart';

Widget otpVerificationWidget() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const customText(text: MyConstants.phoneVerification, fontSize: 20),
        const customText(
          text: MyConstants.enterOtp,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
        const SizedBox(
          height: 40,
        ),

        const PinPutWidget(),
        const SizedBox(height: 40,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: GoogleFonts.poppins(color: Colors.black,fontSize: 12),

                children: [
                  const TextSpan(
                    text: "${MyConstants.resendCode} "
                  ),
                  TextSpan(
                      text:"10 seconds",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold)
                  ),
                ]
              )
          ),
        )
      ],
    ),
  );
}
