import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taxi_app/controller/firestore_controller.dart';
import 'package:taxi_app/views/screens/home/home_screen.dart';
import 'package:taxi_app/views/screens/profile_setting/componets/profile_setting_top_widget.dart';
import 'package:taxi_app/views/screens/profile_setting/componets/textfield_widget.dart';
import 'package:taxi_app/widgets/custom_button.dart';

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  final FirestoreController firestoreController =
      Get.put(FirestoreController());

  TextEditingController nameController = TextEditingController();
  TextEditingController homeController = TextEditingController();
  TextEditingController businessController = TextEditingController();
  TextEditingController shopController = TextEditingController();
final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();
  File? selectedImage;



  getImage(ImageSource imageSource) async {
    XFile? image = await _picker.pickImage(source: imageSource);
    if (image != null) {
      selectedImage = File(image.path);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileSettingTopWidget(
              onTap: () {
                getImage(ImageSource.gallery);
              },
              selectedImage: selectedImage,
            ),


            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    textFieldWidget(
                      title: "name",
                      iconData: Icons.person_outline,
                      controller: nameController,
                      validator: (String? input){
                        if(input!.isEmpty){
                          return "Name is required!";
                        }
                        return null;
                      }
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    textFieldWidget(
                      title: "Home Address",
                      iconData: Icons.home_outlined,
                      controller: homeController,
                        validator: (String? input){
                          if(input!.isEmpty){
                            return "Home address is required!";
                          }
                          return null;
                        }
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    textFieldWidget(
                      title: "Business Address",
                      iconData: Icons.card_travel,
                      controller: businessController,
                        validator: (String? input){
                          if(input!.isEmpty){
                            return "Business address is required!";
                          }
                          return null;
                        }
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    textFieldWidget(
                      title: "Shopping Center",
                      iconData: Icons.shopping_cart_outlined,
                      controller: shopController,
                        validator: (String? input){
                          if(input!.isEmpty){
                            return "Shopping Center is required!";
                          }
                          return null;
                        }
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Obx(() => firestoreController.isProfileUpLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : CustomButton(
                            title: 'Submit',
                            onPressed: () {

                              if(!_formKey.currentState!.validate()){
                                return;
                              }


                              if (selectedImage == null) {
                                Get.snackbar(
                                    "Warning", "Please Add Your Profile Pic!");
                                return;
                              }
                              firestoreController.isProfileUpLoading(true);
                              firestoreController.storeUserInfo(
                                  selectedImage: selectedImage!,
                                  name: nameController.text,
                                  homeAddress: homeController.text,
                                  businessAddress: businessController.text,
                                  shoppingAddress: shopController.text);
                            },
                          ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
