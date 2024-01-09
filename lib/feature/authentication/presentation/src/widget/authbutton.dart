import 'package:flutter/material.dart';
import '../../../../../constants/appcolors.dart';

class AuthButton extends StatelessWidget {
  const AuthButton(
      {super.key,
      this.child,
      this.isloading = false,
      required this.width,
      required this.height,
      required this.radius,
      required this.ontap,
      this.buttoncolor});
  final Widget? child;
  final double width, height, radius;
  final VoidCallback ontap;
  final Color? buttoncolor;
  final bool isloading;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: buttoncolor ?? Appcolors.orange,
            borderRadius: BorderRadius.circular(radius)),
        child: isloading
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : Center(child: child),
      ),
    );
  }
}
