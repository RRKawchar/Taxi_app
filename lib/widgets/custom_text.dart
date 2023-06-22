import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class customText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight? fontWeight;
  final int? maxLine;
  const customText({
    Key? key,
    required this.text,
    this.fontSize = 15.0,
    this.color = Colors.black,
    this.fontWeight,
     this.maxLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      style:
          GoogleFonts.poppins(fontSize: fontSize,fontWeight: fontWeight,color: color)
    );
  }
}
