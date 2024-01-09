import 'package:flutter/material.dart';

import '../../../../../constants/appcolors.dart';

class AuthCheckbox extends StatelessWidget {
  const AuthCheckbox(
      {super.key,
      required this.status,
      required this.width,
      required this.height,
      required this.radius,
      this.ontap});
  final bool status;
  final double width, height, radius;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(color: Appcolors.blue),
          color: status ? Appcolors.blue : Appcolors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Icon(
          Icons.done,
          color: Appcolors.white,
        ),
      ),
    );
  }
}
