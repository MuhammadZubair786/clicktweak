import 'package:flutter/material.dart';

import '../../../../../constants/appcolors.dart';
import '../../../../../constants/apptext.dart';

class SignupOrLogin extends StatelessWidget {
  const SignupOrLogin({
    super.key,
    required this.title,
    required this.subTitle,
    this.ontap,
  });
  final String title, subTitle;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
          text: '$title ',
          color: Appcolors.lightgrey,
        ),
        InkWell(
          onTap: ontap,
          child: AppText(
            text: subTitle,
            color: Appcolors.blue,
            fontweight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
