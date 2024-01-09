import 'package:flutter/material.dart';

import '../../../../../constants/appcolors.dart';
import '../../../../../constants/apptext.dart';
import 'auth_checkbox.dart';

class Terms extends StatelessWidget {
  const Terms({
    super.key,
    required this.size,
    required this.title,
    this.ontap,
    required this.status,
  });

  final Size size;
  final String title;
  final Function()? ontap;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AuthCheckbox(
            ontap: ontap,
            status: status,
            height: size.width * 0.08,
            width: size.width * 0.08,
            radius: size.width * 0.02,
          ),
          SizedBox(
            width: size.width * 0.8,
            child: AppText(
                fontweight: FontWeight.w600,
                color: Appcolors.blue,
                size: 14,
                text: title),
          )
        ],
      ),
    );
  }
}
