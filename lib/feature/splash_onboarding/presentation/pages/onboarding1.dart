import 'package:clicktwaek/config/page%20route/detail/route_name.dart';
import 'package:clicktwaek/feature/splash_onboarding/presentation/bloc/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                    text: 'ClickTeak',
                    size: 16,
                    fontweight: FontWeight.w900)),
            SizedBox(height: size.height * 0.2),
            const AppText(
                textalign: TextAlign.center,
                size: 16,
                text: 'Sign in with your google\naccount'),
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
            )
          ],
        ),
      ),
    );
  }
}
//  