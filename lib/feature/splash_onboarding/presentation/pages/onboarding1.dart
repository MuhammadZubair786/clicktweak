// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:clicktwaek/config/page%20route/detail/route_name.dart';
import 'package:clicktwaek/feature/splash_onboarding/presentation/bloc/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../constants/export.dart';
import '../../data/local/onboarding_images.dart';

class FirstOnboard extends StatefulWidget {
  const FirstOnboard({super.key});

  @override
  State<FirstOnboard> createState() => _FirstOnboardState();
}

class _FirstOnboardState extends State<FirstOnboard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return BlocListener<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        if (state is OnboardingSigin) {
          Navigator.pushNamed(
            context,
            RouteName.referCodeInput,
          );
        }
        if(state is OnAlreadySigin){
            Navigator.pushNamed(
            context,
            RouteName.bottomnav,
          );

        }
      },
      child: AppScaffold(
        backGroundColor: Appcolors.white,
        color: Appcolors.redColor,
        body: Column(
          children: [
            SizedBox(height: size.height * 0.15),
            Image.asset(OnboardingImages.splash,
                height: size.height * 0.1, fit: BoxFit.cover),
            SizedBox(height: size.height * 0.02),
            const Center(
                child: AppText(
                    textalign: TextAlign.center,
                    text: 'ClickTweak',
                    size: 20,
                    fontweight: FontWeight.w900)),
            SizedBox(height: size.height * 0.1),
            const AppText(
                textalign: TextAlign.center,
                size: 16,
                fontweight: FontWeight.bold,
                text: 'Sign in with your google account'),
            SizedBox(height: size.height * 0.035),
            InkWell(
              onTap: () async {
                await context.read<OnboardingCubit>().googleSignIn();
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Appcolors.redColor,
                    borderRadius: BorderRadius.circular(8)),
                height: 50,
                width: size.width * 0.4,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(OnboardingImages.googleLogo),
                    SizedBox(width: size.width * 0.035),
                    AppText(
                        text: 'LOGIN',
                        size: 20,
                        fontweight: FontWeight.w700,
                        color: Appcolors.yellow),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
          Container(
  margin: EdgeInsets.all(24),
  child: Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'By signing, you confirm that you have read and agreed to our Terms and Conditions.',
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: const Color.fromARGB(255, 8, 8, 8), // Change color as needed
          ),
        ),
        GestureDetector(
          onTap: () async {
           await launchUrl(Uri.parse("https://www.freeprivacypolicy.com/live/59462450-89ac-44fd-874c-90b7f0f39f40"));
          },
          child: Text(
            'Click here to view the detailed Terms and Conditions.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 6, 51, 119), // Change color as needed
            ),
          ),
        ),
      ],
    ),
  ),
)]
      ),
    ));
  }
}
//  