import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_app/utils/my_colors.dart';
import 'package:taxi_app/widgets/custom_text.dart';

Widget primaryWidget() {
  return Container(
    height: Get.height * 0.5,
    width: Get.width,
    decoration: const BoxDecoration(
      color: MyColors.primaryColor,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(0),
        bottomRight: Radius.circular(200),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: Get.height / 8,
          width: Get.width / 4,
          decoration: BoxDecoration(
              color: MyColors.whiteColor,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Image.asset('assets/images/taxi.png',width: 70,
            height: 70,),
          ),

        ),
        const SizedBox(height: 10,),
      const customText(text: "TAXI SERVICE",color: MyColors.whiteColor,fontWeight: FontWeight.bold,fontSize: 30,)
      ],
    ),
  );
}
