import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/appcolors.dart';
import '../bloc/cubit/onboarding_cubit.dart';
import '../pages/bottomnav.dart';

Widget buildBottomNavigationBar(OnboardingCubit watchOnboarding,
    OnboardingCubit readOnboarding, Size size) {
  return Container(
    height: size.height * 0.12,
    padding: EdgeInsetsDirectional.symmetric(
      horizontal: size.width * 0.03,
      vertical: size.width * 0.042,
    ),
    decoration: BoxDecoration(
      color: watchOnboarding.bottonnavSelectedIndex == 2
          ? Color.fromARGB(255, 184, 183, 183)
          : Color.fromARGB(255, 184, 183, 183),
      boxShadow: const [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 10,
          offset: Offset(0, -10),
          spreadRadius: 0,
        )
      ],
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      ),
    ),
    child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: size.width * 0.02,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.width * 0.03),
        color: Appcolors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomnavIcon(
            isActive: watchOnboarding.bottonnavSelectedIndex == 0,
            color: watchOnboarding.bottonnavSelectedIndex == 0
                ? Appcolors.redColor
                : Appcolors.blackColor.withOpacity(0.5),
            icon: Icon(
              CupertinoIcons.home,
              size: 20.sp,
              color: watchOnboarding.bottonnavSelectedIndex == 0
                  ? Appcolors.redColor
                  : Appcolors.blackColor.withOpacity(0.5),
            ),
            title: 'Home',
            onTap: () {
              readOnboarding.changebottomnavindex(index: 0);
            },
          ),
          BottomnavIcon(
            isActive: watchOnboarding.bottonnavSelectedIndex == 1,
            color: watchOnboarding.bottonnavSelectedIndex == 1
                ? Appcolors.redColor
                : Appcolors.blackColor.withOpacity(0.5),
            icon: ImageIcon(
              const AssetImage('assets/home/property.png'),
              size: 22.sp,
              color: watchOnboarding.bottonnavSelectedIndex == 1
                  ? Appcolors.redColor
                  : Appcolors.blackColor.withOpacity(0.5),
            ),
            title: 'Plans',
            onTap: () {
              readOnboarding.changebottomnavindex(index: 1);
            },
          ),
          BottomnavIcon(
            color: watchOnboarding.bottonnavSelectedIndex == 2
                ? Appcolors.blue
                : Appcolors.blackColor.withOpacity(0.5),
            isActive: watchOnboarding.bottonnavSelectedIndex == 2,
            icon: ImageIcon(
              const AssetImage('assets/home/mining.png'),
              size: 22.sp,
              color: watchOnboarding.bottonnavSelectedIndex == 2
                  ? Appcolors.blue
                  : Appcolors.blackColor.withOpacity(0.5),
            ),
            title: 'Mining',
            onTap: () {
              readOnboarding.changebottomnavindex(index: 2);
            },
          ),
          BottomnavIcon(
            color: watchOnboarding.bottonnavSelectedIndex == 3
                ? Appcolors.redColor
                : Appcolors.blackColor.withOpacity(0.5),
            isActive: watchOnboarding.bottonnavSelectedIndex == 3,
            icon: ImageIcon(
              const AssetImage('assets/home/earn.png'),
              size: 22.sp,
              color: watchOnboarding.bottonnavSelectedIndex == 3
                  ? Appcolors.redColor
                  : Appcolors.blackColor.withOpacity(0.5),
            ),
            title: 'Withdraw',
            onTap: () {
              readOnboarding.changebottomnavindex(index: 3);
            },
          ),
        ],
      ),
    ),
  );
}
