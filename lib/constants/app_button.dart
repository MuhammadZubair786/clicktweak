import 'package:flutter/material.dart';

import 'export.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      this.child,
      this.width,
      this.height,
      this.radius,
      this.ontap,
      this.buttoncolor});
  final Widget? child;
  final double? width, height, radius;
  final Function()? ontap;
  final Color? buttoncolor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: ontap,
      child: Container(
        width: width ?? size.width,
        height: height ?? size.height * 0.05,
        decoration: BoxDecoration(
            color: buttoncolor ?? Appcolors.redColor,
            borderRadius: BorderRadius.circular(radius ?? size.width * 0.015)),
        child: Center(child: child),
      ),
    );
  }
}
