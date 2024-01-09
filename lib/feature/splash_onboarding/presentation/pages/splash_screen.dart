import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/page route/page_route.dart';
import '../../../../constants/export.dart';
import '../../data/local/onboarding_Images.dart';
import '../bloc/cubit/onboarding_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<OnboardingCubit>().delaySplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return BlocListener<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        if (state is OnboardingLoadedState) {
          if (FirebaseAuth.instance.currentUser == null) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RouteName.firstonboarding,
              (route) => false,
            );
          } else {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RouteName.bottomnav,
              (route) => false,
            );
          }
        }
      },
      // BlocListener<OnboardingCubit, OnboardingState>(
      //   listener: (context, state) {
      //     if (state is OnboardingLoadedState) {
      //       Navigator.pushNamedAndRemoveUntil(
      //           context, RouteName.firstonboarding, (route) => false);
      //     }
      //   },
      child: AppScaffold(
          backGroundColor: Appcolors.white,
          color: Appcolors.redColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Image.asset(OnboardingImages.splash,
                      height: size.height * 0.1, fit: BoxFit.cover)),
              SizedBox(height: size.height * 0.035),
              const AppText(
                  textalign: TextAlign.center,
                  text: 'ClickTeak',
                  size: 16,
                  fontweight: FontWeight.w900)
            ],
          )),
    );
  }
}
