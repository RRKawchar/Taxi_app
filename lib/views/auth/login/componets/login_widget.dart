import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi_app/utils/my_constants.dart';
import 'package:taxi_app/views/auth/otp_verification/otp_verification_screen.dart';
import 'package:taxi_app/widgets/custom_text.dart';

Widget loginWidget(
    {required CountryCode countryCode,
    required VoidCallback onTap,
    void Function(String)? onSubmitted}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const customText(text: MyConstants.welcome, fontSize: 20),
        const customText(
          text: MyConstants.letsHaveNiceTrip,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 5,
                blurRadius: 3)
          ]),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: onTap,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Container(
                          child: countryCode.flagImage(),
                        )),
                        customText(text: countryCode.dialCode),
                        const Icon(Icons.keyboard_arrow_down_outlined)
                      ],
                    ),
                  )),
              Container(
                height: 55,
                width: 2,
                color: Colors.black.withOpacity(0.2),
              ),
              Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      // onTap: (){
                      //   Get.to(()=> OtpVerificationScreen());
                      // },
                      onSubmitted: onSubmitted,
                      decoration: InputDecoration(
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.normal),
                          hintText: "Enter your mobile number",
                          border: InputBorder.none),
                    ),
                  )),
            ],
          ),
        )
      ],
    ),
  );
}
