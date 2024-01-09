import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  const AppText(
      {super.key,
      required this.text,
      this.size = 18,
      this.maxline = 3,
      this.color = Colors.black,
      this.fontweight = FontWeight.w400,
      this.textalign});
  final String text;
  final FontWeight? fontweight;
  final Color color;
  final double size;
  final int maxline;
  final TextAlign? textalign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textalign,
      softWrap: true,
      maxLines: maxline,
      style: GoogleFonts.inter(
          fontSize: size.sp, fontWeight: fontweight, color: color),
    );
  }
}
