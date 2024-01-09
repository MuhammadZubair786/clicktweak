import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'export.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Row(
      children: [
        GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios,
                size: 25.sp, color: Appcolors.white)),
        SizedBox(width: size.width * 0.03),
        AppText(
            text: title, fontweight: FontWeight.w600, color: Appcolors.white)
      ],
    );
  }
}
