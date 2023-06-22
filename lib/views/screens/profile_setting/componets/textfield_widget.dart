import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi_app/utils/my_colors.dart';
import 'package:taxi_app/widgets/custom_text.dart';

Widget textFieldWidget(
    {required String title,
    required IconData iconData,
    required TextEditingController controller,
      required Function validator,
    }) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      customText(text:title,color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w400,),
      const SizedBox(height: 6,),

      Container(
        alignment: Alignment.center,
        width: Get.width,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: MyColors.blackColor.withOpacity(0.05),
              blurRadius: 1,
              spreadRadius: 1
            )
          ],
          borderRadius: BorderRadius.circular(8)
        ),
        child: TextFormField(
          validator: (input){
            return validator(input);
          },
          style: GoogleFonts.poppins(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w400),
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(iconData,color: MyColors.primaryColor,size: 30,),

          ),
        ),
      )

    ],
  );
}
