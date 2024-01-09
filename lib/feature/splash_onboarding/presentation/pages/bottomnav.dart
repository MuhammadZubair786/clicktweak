import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clicktwaek/feature/minning/presentation/pages/miningSplash.dart';
import 'package:clicktwaek/feature/plans/presentation/pages/plans.dart';
import 'package:clicktwaek/feature/withdraw/presentation/pages/witdraw.dart';
import 'package:clicktwaek/constants/export.dart';
import 'package:clicktwaek/feature/splash_onboarding/presentation/bloc/cubit/onboarding_cubit.dart';

import '../../../home/presentration/pages/home.dart';
import '../../../home/presentration/src/widgets/navigationDrawer.dart';
import '../widgets/widgets.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final watchOnboarding = context.watch<OnboardingCubit>();
    final readOnboarding = context.read<OnboardingCubit>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: watchOnboarding.bottonnavSelectedIndex,
        children: [
          const HomePage(),
          const Plans(),
          MiningSplash(),
          const Withdraw(),
        ],
      ),

      bottomNavigationBar:
          buildBottomNavigationBar(watchOnboarding, readOnboarding, size),
      // Container(
      //   height: size.height * 0.12,
      //   padding: EdgeInsetsDirectional.symmetric(
      //     horizontal: size.width * 0.03,
      //     vertical: size.width * 0.042,
      //   ),
      //   decoration: BoxDecoration(
      //     color: watchOnboarding.bottonnavSelectedIndex == 2
      //         ? Appcolors.blue
      //         : Appcolors.white,
      //     boxShadow: const [
      //       BoxShadow(
      //         color: Color(0x07000000),
      //         blurRadius: 10,
      //         offset: Offset(0, -10),
      //         spreadRadius: 0,
      //       )
      //     ],
      //     borderRadius: const BorderRadius.only(
      //       topRight: Radius.circular(20),
      //       topLeft: Radius.circular(20),
      //     ),
      //   ),
      // child: Container(
      //   padding: EdgeInsets.symmetric(
      //     horizontal: size.width * 0.05,
      //     vertical: size.width * 0.02,
      //   ),
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(size.width * 0.03),
      //     color: Appcolors.lightgrey,
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       BottomnavIcon(
      //         isActive: watchOnboarding.bottonnavSelectedIndex == 0,
      //         icon: Icon(
      //           Icons.home,
      //           size: 25.sp,
      //           color: watchOnboarding.bottonnavSelectedIndex == 0
      //               ? Appcolors.redColor
      //               : Appcolors.blackColor.withOpacity(0.5),
      //         ),
      //         title: 'Home',
      //         onTap: () {
      //           readOnboarding.changebottomnavindex(index: 0);
      //         },
      //       ),
      //       BottomnavIcon(
      //         isActive: watchOnboarding.bottonnavSelectedIndex == 1,
      //         icon: ImageIcon(
      //           const AssetImage('assets/home/property.png'),
      //           size: 25.sp,
      //           color: watchOnboarding.bottonnavSelectedIndex == 1
      //               ? Appcolors.redColor
      //               : Appcolors.blackColor.withOpacity(0.5),
      //         ),
      //         title: 'Plans',
      //         onTap: () {
      //           readOnboarding.changebottomnavindex(index: 1);
      //         },
      //       ),
      //       BottomnavIcon(
      //         isActive: watchOnboarding.bottonnavSelectedIndex == 2,
      //         icon: ImageIcon(
      //           const AssetImage('assets/home/mining.png'),
      //           size: 25.sp,
      //           color: watchOnboarding.bottonnavSelectedIndex == 2
      //               ? Appcolors.blue
      //               : Appcolors.blackColor.withOpacity(0.5),
      //         ),
      //         title: 'Mining',
      //         onTap: () {
      //           // Show the mining splash screen when the Mining tab is selected
      //           Navigator.of(context).push(MaterialPageRoute(
      //             builder: (context) => MiningSplash(
      //               onSplashFinish: () {
      //                 // Callback function to be executed when the splash screen finishes
      //                 readOnboarding.changebottomnavindex(index: 2);
      //               },
      //             ),
      //           ));
      //         },
      //       ),
      //       BottomnavIcon(
      //         isActive: watchOnboarding.bottonnavSelectedIndex == 3,
      //         icon: ImageIcon(
      //           const AssetImage('assets/home/earn.png'),
      //           size: 25.sp,
      //           color: watchOnboarding.bottonnavSelectedIndex == 3
      //               ? Appcolors.redColor
      //               : Appcolors.blackColor.withOpacity(0.5),
      //         ),
      //         title: 'Withdraw',
      //         onTap: () {
      //           readOnboarding.changebottomnavindex(index: 3);
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      // ),
    );
  }
}

class BottomnavIcon extends StatelessWidget {
  const BottomnavIcon(
      {super.key,
      this.isActive = false,
      required this.title,
      required this.icon,
      required this.color,
      this.onTap});
  final String title;
  final Widget icon;
  final Function()? onTap;
  final Color color;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          // Icon(icon,
          // size: 25.sp,
          // color: isActive
          //     ? Appcolors.redColor
          //     : Appcolors.blackColor.withOpacity(0.5)),
          icon,
          AppText(text: title, size: 12, color: color)
        ],
      ),
    );
  }
}





// BottomNavigationBar(
//         unselectedItemColor: Appcolors.lightgrey,
//         selectedItemColor: Appcolors.orange,
//         backgroundColor: Appcolors.blue,
//         showUnselectedLabels: true,
//         type: BottomNavigationBarType.shifting,
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//               icon: Icon(Icons.home_repair_service, size: 35.sp),
//               label: 'Home'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.message, size: 35.sp), label: 'Messages'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.assignment, size: 35.sp), label: 'Booking'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.account_circle, size: 35.sp), label: 'Profile')
//         ],
//         currentIndex: watchOnboarding.bottonnavSelectedIndex,
//         onTap: (value) {
//           readOnboarding.changebottomnavindex(index: value);
//         },
//       ),