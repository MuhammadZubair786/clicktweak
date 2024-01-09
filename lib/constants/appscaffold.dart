import 'package:clicktwaek/constants/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold(
      {super.key,
      required this.color,
      required this.body,
      this.drawer,
      required this.backGroundColor});
  final Color color;
  final Color backGroundColor;
  final Widget? drawer;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: color,
          )),
      body: body,
    );
  }
}
