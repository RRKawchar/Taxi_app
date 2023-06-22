import 'package:flutter/material.dart';
import 'package:taxi_app/utils/my_colors.dart';

class OtpBackButton extends StatelessWidget {
  const OtpBackButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: MyColors.whiteColor),
        child: const Icon(
          Icons.arrow_back_ios,
          color: MyColors.primaryColor,
        ),
      ),
    );
  }
}