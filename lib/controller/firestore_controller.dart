import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:taxi_app/views/screens/home/home_screen.dart';
import 'package:path/path.dart' as path;

class FirestoreController extends GetxController{

  var isProfileUpLoading=false.obs;

  uploadImage(File image) async {
    String imageUrl = '';
    String fileName = path.basename(image.path);
    var reference = FirebaseStorage.instance.ref().child('users/$fileName');
    UploadTask uploadTask = reference.putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    await taskSnapshot.ref.getDownloadURL().then(
          (value) {
        imageUrl = value;
        print("Download URL: $value");
      },
    );

    return imageUrl;
  }
  storeUserInfo({
    required File selectedImage,
    required String name,
    required String homeAddress,
    required String businessAddress,
    required String shoppingAddress,

}) async {
    String url = await uploadImage(selectedImage);
    String uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance.collection('users').doc(uid).set({
      "image": url,
      "name": name,
      "home_address":homeAddress,
      "business_address": businessAddress,
      "shopping_address": shoppingAddress,
    }).then((value) {

      isProfileUpLoading(false);
      Get.to(() =>  HomeScreen());
    });
  }

}