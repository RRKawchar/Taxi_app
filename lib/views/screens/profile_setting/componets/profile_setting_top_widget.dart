import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_app/utils/my_colors.dart';
import 'package:taxi_app/widgets/custom_text.dart';

class ProfileSettingTopWidget extends StatelessWidget {
  const ProfileSettingTopWidget({
    super.key,
    required this.onTap,
    required this.selectedImage,
  });
  final VoidCallback onTap;
  final File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _topWidget(),
        Positioned(
          bottom: -20,
          left: 130,
          right: 130,
          child: InkWell(
            onTap: onTap,
            child: selectedImage == null
                ? Container(
                    height: 110,
                    width: 110,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xFFD6D6D6)),
                    child: const Center(
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  )
                : Container(
                    height: 110,
                    width: 110,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(selectedImage!)),
                        shape: BoxShape.circle,
                        color: const Color(0xFFD6D6D6)),
                  ),
          ),
        ),
      ],
    );
  }

  Widget _topWidget() {
    return SizedBox(
        height: Get.height / 3.4,
        child: Container(
          alignment: Alignment.center,
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
              color: MyColors.primaryColor,
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(300))),
          child: Container(
            alignment: Alignment.center,
            height: Get.height * 0.1,
            width: Get.width,
            margin: EdgeInsets.only(bottom: Get.height * 0.05),
            child: const customText(
              text: "Profile Settings",
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ));
  }
}
