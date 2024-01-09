import 'package:clicktwaek/constants/app_button.dart';
import 'package:clicktwaek/constants/appcolors.dart';
import 'package:clicktwaek/constants/appscaffold.dart';
import 'package:clicktwaek/constants/appshadowcontainer.dart';
import 'package:clicktwaek/constants/apptext.dart';
import 'package:clicktwaek/feature/home/data/home_images.dart';
import 'package:clicktwaek/feature/home/presentration/src/home_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Refer extends StatelessWidget {
  const Refer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        backGroundColor: Appcolors.white,
        color: Appcolors.redColor,
        body: Column(
          children: [
            HomeAppbar(),
            SizedBox(height: size.height * 0.07),
            CircleAvatar(
                radius: 70.sp,
                backgroundColor: Appcolors.blackColor.withOpacity(0.2),
                child: Image.asset(HomeImages.box)),
            SizedBox(height: size.height * 0.02),
            const AppText(
                text: 'Refer & Earn', size: 22, fontweight: FontWeight.w700),
            SizedBox(height: size.height * 0.02),
            const AppText(
                textalign: TextAlign.center,
                size: 16,
                text:
                    'Share this code with your friends and\nearn when they join'),
            SizedBox(height: size.height * 0.075),
            const ReferalCode(),
            SizedBox(height: size.height * 0.31),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: AppButton(
                child: AppText(
                    text: 'Invite friends ',
                    size: 14,
                    fontweight: FontWeight.w700,
                    color: Appcolors.yellow),
              ),
            )
          ],
        ));
  }
}

class ReferalCode extends StatelessWidget {
  const ReferalCode({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppshadowContainer(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.055),
      padding: EdgeInsets.symmetric(vertical: size.height * 0.015),
      color: const Color(0xFFF0FEF9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AppText(
              text: 'LANDCOIN444', size: 16, fontweight: FontWeight.w600),
          SizedBox(width: size.width * 0.075),
          Row(
            children: [
              Icon(Icons.copy, color: Appcolors.blue, size: 25.sp),
              AppText(
                  text: '  Copy Code',
                  size: 14,
                  color: Appcolors.blue,
                  fontweight: FontWeight.w700)
            ],
          )
        ],
      ),
    );
  }
}
