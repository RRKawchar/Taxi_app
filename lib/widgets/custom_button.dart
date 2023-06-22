import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_app/utils/my_colors.dart';
import 'package:taxi_app/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.title, this.onPressed}) : super(key: key);
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: MyColors.primaryColor,
      height: 50,
        minWidth: Get.width,
        onPressed: onPressed,


            shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),

    ),
      child: customText(text: title,fontSize: 16,color: MyColors.whiteColor,),
    );
  }
}
