import 'package:clicktwaek/config/page%20route/page_route.dart';
import 'package:clicktwaek/constants/app_button.dart';
import 'package:clicktwaek/constants/appcolors.dart';
import 'package:clicktwaek/constants/appscaffold.dart';
import 'package:clicktwaek/constants/apptext.dart';
import 'package:clicktwaek/feature/home/presentration/src/home_exports.dart';
import 'package:clicktwaek/feature/splash_onboarding/presentation/bloc/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReferalCodeInput extends StatelessWidget {
  const ReferalCodeInput({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        backGroundColor: Appcolors.white,
        color: Appcolors.redColor,
        body: Column(
          children: [
            const HomeAppbar(),
            SizedBox(height: size.height * 0.13),
            Expanded(
                child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(text: 'Enter referral code', size: 16),
                  SizedBox(height: size.height * 0.015),
                  AppTextField(),
                  SizedBox(height: size.height * 0.54),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RouteName.bottomnav,
                        (route) => false,
                      );
                      // context.read<OnboardingCubit>().addUserInfo();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Appcolors.redColor,
                          borderRadius: BorderRadius.circular(8)),
                      height: 50,
                      width: double.infinity,
                      child: Center(
                        child: AppText(
                            text: 'Continue',
                            size: 14,
                            fontweight: FontWeight.w500,
                            color: Appcolors.yellow),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.015)
                ],
              ),
            ))
          ],
        ));
  }
}

class AppTextField extends StatelessWidget {
  const AppTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return TextField(
        decoration: InputDecoration(
            hintText: 'Optional ',
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(size.width * 0.02),
                borderSide: BorderSide(color: Appcolors.redColor)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(size.width * 0.02),
                borderSide: BorderSide(color: Appcolors.redColor))));
  }
}
