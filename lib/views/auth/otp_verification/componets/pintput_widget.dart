import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:taxi_app/controller/auth_controller.dart';

class PinPutWidget extends StatefulWidget {
  const PinPutWidget({Key? key}) : super(key: key);

  @override
  State<PinPutWidget> createState() => _PinPutWidgetState();

  @override
  String toStringShort() => "PinPut rounded";
}

class _PinPutWidgetState extends State<PinPutWidget> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  AuthController authController=Get.find<AuthController>();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultTheme = PinTheme(
        width: 60,
        height: 64,
        textStyle: GoogleFonts.poppins(
          fontSize: 20,
          color: const Color.fromRGBO(70, 69, 66, 1),
        ),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(232, 235, 241, 0.35),
            borderRadius: BorderRadius.circular(8)));

    final cursor = Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 21,
        height: 1,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(137, 146, 160, 1),
            borderRadius: BorderRadius.circular(8)),
      ),
    );

    return Pinput(
      length: 6,
      controller: controller,
      focusNode: focusNode,
      onCompleted: (String input){
        authController.verifyOtp(input);
      },
      defaultPinTheme: defaultTheme.copyWith(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.05556775555454),
                offset: Offset(0, 3),
                blurRadius: 16)
          ],
        ),
      ),
      separator: const SizedBox(
        width: 16,
      ),
      focusedPinTheme: defaultTheme.copyWith(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.05556775555454),
                offset: Offset(0, 3),
                blurRadius: 16)
          ])),
      showCursor: true,
      cursor: cursor,
    );
  }
}
