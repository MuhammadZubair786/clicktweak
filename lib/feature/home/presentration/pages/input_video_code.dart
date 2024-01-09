import 'package:clicktwaek/constants/export.dart';
import 'package:clicktwaek/feature/plans/presentation/pages/plans_details.dart';
import 'package:clicktwaek/feature/splash_onboarding/data/local/onboarding_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../splash_onboarding/presentation/bloc/cubit/onboarding_cubit.dart';
import '../../../splash_onboarding/presentation/pages/referal_code.dart';

class VideoCode extends StatelessWidget {
  const VideoCode({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        backGroundColor: Appcolors.white,
        color: Appcolors.redColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBarWithArrowAndIcon(),
            SizedBox(height: size.height * 0.13),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                child: const AppText(text: 'Enter Video code', size: 16)),
            SizedBox(height: size.height * 0.015),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                child: const AppTextField()),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: InkWell(
                onTap: () async {
                  OnboardingCubit onboardingCubit =
                      context.read<OnboardingCubit>();
                  if (await onboardingCubit.isCodeValid()) {
                    // Show the success dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SuccessDialog();
                      },
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return FialedDialog(
                          message: 'Your code is Expire Now',
                        );
                      },
                    );
                  }
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
            ),
            SizedBox(height: size.height * 0.025),
          ],
        ));
  }
}

class SuccessDialog extends StatelessWidget {
  String? message = '';
  SuccessDialog({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          color: Appcolors.white,
          width: size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: size.height * 0.015),
              SizedBox(height: size.height * 0.015),
              Image.asset(OnboardingImages.splash),
              SizedBox(height: size.height * 0.015),
              AppText(
                  text: 'Congratulations!',
                  fontweight: FontWeight.w800,
                  size: 20,
                  color: Appcolors.blue),
              SizedBox(height: size.height * 0.015),
              const AppText(text: 'You watched the video', size: 20),
              SizedBox(height: size.height * 0.015),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: AppText(
                    text: message ?? '',
                    fontweight: FontWeight.w600,
                  )),
              SizedBox(height: size.height * 0.015),
              const AppText(
                  textalign: TextAlign.center,
                  text: 'Click OK to see changes in your\n balance',
                  size: 14),
              SizedBox(height: size.height * 0.03),
              AppButton(
                  ontap: () {
                    Navigator.pop(context);
                  },
                  width: size.width * 0.45,
                  child: AppText(
                      text: 'Ok',
                      fontweight: FontWeight.w500,
                      size: 16,
                      color: Appcolors.yellow)),
              SizedBox(height: size.height * 0.025),
            ],
          ),
        ));
  }
}

class FialedDialog extends StatelessWidget {
  String? message = '';
  FialedDialog({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          color: Appcolors.white,
          width: size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: size.height * 0.015),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: AppText(
                    text: message ?? '',
                  )),
              Image.asset(OnboardingImages.splash),
              SizedBox(height: size.height * 0.015),
              AppText(
                  text: 'Failed',
                  fontweight: FontWeight.w800,
                  size: 20,
                  color: Appcolors.blue),
              SizedBox(height: size.height * 0.015),
              const AppText(
                  textalign: TextAlign.center,
                  text:
                      'Go to youtube and watch the video in full to rereceive the code',
                  size: 14),
              SizedBox(height: size.height * 0.03),
              AppButton(
                  ontap: () {
                    Navigator.pop(context);
                  },
                  width: size.width * 0.45,
                  child: AppText(
                      text: 'Ok',
                      fontweight: FontWeight.w500,
                      size: 16,
                      color: Appcolors.yellow)),
              SizedBox(height: size.height * 0.025),
            ],
          ),
        ));
  }
}

// class UnderConstructed extends StatelessWidget {
//   const UnderConstructed({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.sizeOf(context);
//     return 
//   }
// }
