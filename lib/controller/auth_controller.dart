import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_app/views/screens/home/home_screen.dart';
import 'package:taxi_app/views/screens/profile_setting/profile_setting_screen.dart';

class AuthController extends GetxController {
  String userUid = '';
  var verId = "";
  int? resendTokenId;
  bool phoneAuthCheck = false;
  dynamic credentials;

  final FirebaseAuth auth=FirebaseAuth.instance;
  final FirebaseFirestore firestore=FirebaseFirestore.instance;

  phoneAuth(String phone) async {
    try {
      credentials = null;
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phone,
          timeout: const Duration(seconds: 60),
          verificationCompleted: (PhoneAuthCredential credential) async {
            log('complete');
            credentials = credential;
            await FirebaseAuth.instance.signInWithCredential(credential);
          },
          forceResendingToken: resendTokenId,
          verificationFailed: (FirebaseAuthException e) {
            log('Failed');
            if (e.code == 'invalid-phone-number') {
              debugPrint("The provider phone number is not valid");
            }
          },
          codeSent: (String verificationId, int? resendToken) async {
            log('Code sent');
            verId = verificationId;
            resendTokenId = resendToken;
          },
          codeAutoRetrievalTimeout: (String verificationId) {});
    } catch (e) {
      log("Error occurred $e");
    }
  }

  verifyOtp(String otpNumber) async {
    log("Called");
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
      verificationId: verId,
      smsCode: otpNumber,
    );
    log("LoggedIn");

    await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential).then((value){
      decidedRout();
    });
  }

  decidedRout(){
    User? user= auth.currentUser;
    if(user !=null){
      firestore.collection('users').doc(user.uid).get().then((value){

        if(value.exists){
          Get.to(()=> HomeScreen());
        }else{
          Get.to(()=>const ProfileSettingScreen());
        }
      });
    }

  }
}
