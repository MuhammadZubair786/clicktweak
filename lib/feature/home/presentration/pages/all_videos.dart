import 'package:clicktwaek/constants/appcolors.dart';
import 'package:clicktwaek/constants/appscaffold.dart';
import 'package:clicktwaek/feature/home/presentration/src/home_exports.dart';
import 'package:clicktwaek/feature/plans/presentation/pages/plans_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../splash_onboarding/presentation/bloc/cubit/onboarding_cubit.dart';

class AllVideos extends StatelessWidget {
  const AllVideos({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        backGroundColor: Appcolors.white,
        color: Appcolors.redColor,
        body: Column(
          children: [
            const AppBarWithArrowAndIcon(),
            SizedBox(height: size.height * 0.015),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                    5,
                    (index) => Padding(
                          padding: EdgeInsets.only(bottom: size.width * 0.02),
                          child: HomeVideo(
                              ontap: () => lauchyoutube(
                                  youtube: context
                                      .read<OnboardingCubit>()
                                      .videos
                                      .last
                                      .url!)),
                        )),
              ),
            ))
          ],
        ));
  }

  lauchyoutube({required String youtube}) async {
    final video = Uri.parse(youtube);
    if (await canLaunchUrl(video)) {
      launchUrl(video);
    } else {
      throw 'Could not launch $video';
    }
  }
}
