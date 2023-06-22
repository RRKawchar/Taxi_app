import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi_app/controller/auth_controller.dart';
import 'package:taxi_app/views/auth/login/login_screen.dart';
import 'package:taxi_app/views/screens/profile_setting/profile_setting_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    AuthController authController=Get.put(AuthController());
    authController.decidedRout();
    final textTheme=Theme.of(context).textTheme;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taxi',
      theme: ThemeData(
      textTheme: GoogleFonts.poppinsTextTheme(textTheme)
      ),
      home:const LoginScreen(),
    );
  }
}


