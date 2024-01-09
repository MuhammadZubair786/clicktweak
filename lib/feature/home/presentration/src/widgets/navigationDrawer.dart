import 'package:clicktwaek/feature/home/data/home_images.dart';
import 'package:clicktwaek/feature/home/presentration/src/home_exports.dart';
import 'package:clicktwaek/feature/minning/presentation/pages/miningSplash.dart';
import 'package:clicktwaek/feature/plans/presentation/pages/plans.dart';
import 'package:clicktwaek/feature/plans/presentation/pages/plans_details.dart';
import 'package:clicktwaek/feature/withdraw/presentation/pages/witdraw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/page route/detail/route_name.dart';
import '../../../../../constants/export.dart';
import '../../../../splash_onboarding/presentation/bloc/cubit/onboarding_cubit.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    // context.read<OnboardingCubit>().getUserData();
    final userDoc = context.read<OnboardingCubit>().userDoc;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Appcolors.redColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                    radius: 30.sp,
                    backgroundImage: NetworkImage(userDoc['avatar'] ?? '')),
                SizedBox(height: size.height * 0.015),
                AppText(
                  text: userDoc['email'] ?? 'Default Email',
                  size: 13,
                  color: Appcolors.yellow,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Withdraw()));
            },
            child: SideBarInfo(
                icon: Image.asset(HomeImages.deposite, height: 25.sp),
                title: 'Deposit'),
          ),
          GestureDetector(
            onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Plans()));
            },
            child: SideBarInfo(
                icon: Image.asset(HomeImages.plans, height: 25.sp),
                title: 'Plans'),
          ),
          GestureDetector(
            onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MiningSplash()));
            },
            child: SideBarInfo(
                icon: Image.asset(HomeImages.mining, height: 25.sp),
                title: 'Mining'),
          ),
          SideBarInfo(
              icon: Image.asset(HomeImages.support, height: 25.sp),
              title: 'Support',
              ontap: () => Navigator.pushNamed(context, RouteName.support)),
          Divider(color: Appcolors.blackColor),
          const AppText(
              text: 'Settings', size: 14, fontweight: FontWeight.w500),
          SideBarInfo(
              icon: Image.asset(HomeImages.language, height: 25.sp),
              title: 'Language '),
          Divider(color: Appcolors.blackColor),
          const AppText(
              text: 'Communicate ', size: 14, fontweight: FontWeight.w500),
          SideBarInfo(
              icon: Icon(Icons.person_add_alt_1, size: 25.sp),
              title: 'Invite friends',
              ontap: () => Navigator.pushNamed(context, RouteName.refer)),
          SideBarInfo(
              icon: Icon(Icons.people_alt, size: 25.sp), title: 'Community '),
          SideBarInfo(
              icon: Icon(Icons.star_rounded, size: 25.sp), title: 'Rate us '),
          Divider(color: Appcolors.blackColor),
          const AppText(text: 'Account', size: 14, fontweight: FontWeight.w500),
          SideBarInfo(
            ontap: () {
              context.read<OnboardingCubit>().signOut().then((value) {
                Navigator.pushNamedAndRemoveUntil(
                    context, RouteName.firstonboarding, (route) => false);
              });
            },
            icon: Image.asset(HomeImages.logOut, height: 25.sp),
            title: 'Log Out',
          ),
          SideBarInfo(
              icon: Image.asset(HomeImages.privacyPolicy, height: 25.sp),
              title: 'privacy Policy'),
        ],
      ),
    );
  }
}
