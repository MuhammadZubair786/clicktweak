import 'dart:developer';

import 'package:clicktwaek/config/page%20route/detail/route_name.dart';
import 'package:clicktwaek/constants/export.dart';
import 'package:clicktwaek/feature/home/data/home_images.dart';
import 'package:clicktwaek/feature/splash_onboarding/data/local/onboarding_Images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlansDetails extends StatefulWidget {
  var data;
   PlansDetails({super.key,this.data});

  @override
  State<PlansDetails> createState() => _PlansDetailsState();
}

class _PlansDetailsState extends State<PlansDetails> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    // List<dynamic> arguments = ModalRoute.of(context)!.settings.arguments as List<dynamic>;

    return AppScaffold(
        backGroundColor: Appcolors.white,
        color: Appcolors.redColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBarWithArrowAndIcon(),
            SizedBox(height: size.height * 0.16),
            Center(
                child:
                    Image.asset(HomeImages.wlogo, color: Appcolors.redColor)),
            SizedBox(height: size.height * 0.08),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                child: AppText(
                    text: ' Total to pay \$ ${widget.data["price"].toString()}',
                    size: 20,
                    color: Appcolors.blackColor)),
            SizedBox(height: size.height * 0.010),
             PlanDetailsContainer(data:widget.data),
             SizedBox(height: size.height * 0.26),
            // Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: InkWell(
                onTap: () {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return const PaymentNotSuccesDialog();
                      });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Appcolors.redColor,
                      borderRadius: BorderRadius.circular(8)),
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: AppText(
                        text: 'Confirm payment',
                        size: 14,
                        fontweight: FontWeight.w700,
                        color: Appcolors.yellow),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.045)
            // SizedBox(height: size.height * 0.25),
          ],
        ));
  }
}

class PlanDetailsContainer extends StatefulWidget {
  var data;
   PlanDetailsContainer({super.key,this.data});

  @override
  State<PlanDetailsContainer> createState() => _PlanDetailsContainerState();
}

class _PlanDetailsContainerState extends State<PlanDetailsContainer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppshadowContainer(
      padding: EdgeInsets.symmetric(
          vertical: size.width * 0.02, horizontal: size.width * 0.03),
      radius: size.width * 0.02,
      margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.03, vertical: size.height * 0.005),
      shadowcolour: Appcolors.white,
      color: Appcolors.redColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            AppText(
                text: '${widget.data["title"]}',
                size: 16,
                fontweight: FontWeight.w900,
                color: Appcolors.white),
            SizedBox(height: size.height * 0.003),
            AppText(
                text: 'Price',
                size: 16,
                fontweight: FontWeight.w700,
                color: Appcolors.white),
            SizedBox(height: size.height * 0.002),
            AppText(
                text: '${widget.data["price"]}',
                size: 16,
                fontweight: FontWeight.w700,
                color: Appcolors.white),
            SizedBox(height: size.height * 0.002),
            AppText(
                text: 'Earnings per day',
                size: 16,
                fontweight: FontWeight.w700,
                color: Appcolors.white),
            SizedBox(height: size.height * 0.002),
            AppText(
                text: '\$ ${widget.data["earn_per_video"]}/ \$ ${widget.data["total_earn_user"].toString()}',
                size: 16,
                fontweight: FontWeight.w700,
                color: Appcolors.white)
          ]),
          Column(
            children: [
              Image.asset(HomeImages.wlogo, color: Appcolors.white),
              SizedBox(height: size.height * 0.062),
              AppText(
                  text: 'Join Now',
                  size: 16,
                  fontweight: FontWeight.w900,
                  color: Appcolors.yellow)
            ],
          )
        ],
      ),
    );
  }
}

class AppBarWithArrowAndIcon extends StatelessWidget {
  const AppBarWithArrowAndIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppshadowContainer(
      padding: EdgeInsets.symmetric(
          vertical: size.width * 0.02, horizontal: size.width * 0.03),
      radius: 0,
      shadowcolour: Appcolors.white,
      color: Appcolors.redColor,
      child: Row(children: [
        GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back, size: 35.sp, color: Appcolors.white)),
        SizedBox(width: size.width * 0.025),
        AppText(
            size: 20,
            text: 'ClickTweak',
            fontweight: FontWeight.w900,
            color: Appcolors.white)
      ]),
    );
  }
}


class PaymentNotSuccesDialog extends StatelessWidget {
  const PaymentNotSuccesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: size.width,
        color: Appcolors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: size.height * 0.025),
            Image.network("https://i.postimg.cc/G3yPJK6j/TEST.png",
                width: size.width * 0.9),
            SizedBox(height: size.height * 0.035),
            AppText(
                text: 'Insufficient Balance',
                size: 20,
                color: Color(0xffC70404),
                fontweight: FontWeight.w800),
            SizedBox(height: size.height * 0.025),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppText(
                  textalign: TextAlign.center,
                  text: 'Your request cannot be processed due to insufficient  balance',
                  size: 20,
                  color: Appcolors.blackColor,),
            ),
            SizedBox(height: size.height * 0.035),
            AppButton(
              width: size.width * 0.65,
              height: size.height * 0.05,
              child: AppText(
                  text: 'Ok, Thanks!',
                  size: 14,
                  fontweight: FontWeight.w800,
                  color: Appcolors.yellow),
              ontap: () => Navigator.pushNamedAndRemoveUntil(
                  context, RouteName.bottomnav, (route) => false),
            ),
            SizedBox(height: size.height * 0.025),
          ],
        ),
      ),
    );
  }
}


class PaymentSuccesDialog extends StatelessWidget {
  const PaymentSuccesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: size.width,
        color: Appcolors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: size.height * 0.025),
            Image.asset(OnboardingImages.splash,
                color: Appcolors.redColor, width: size.width * 0.3),
            SizedBox(height: size.height * 0.035),
            AppText(
                text: 'Successful!',
                size: 20,
                color: Appcolors.blue,
                fontweight: FontWeight.w800),
            SizedBox(height: size.height * 0.025),
            AppText(
                textalign: TextAlign.center,
                text: 'You successfully\nactivated the plan',
                size: 20,
                color: Appcolors.blackColor),
            SizedBox(height: size.height * 0.035),
            AppButton(
              width: size.width * 0.65,
              height: size.height * 0.05,
              child: AppText(
                  text: 'Ok, Thanks!',
                  size: 14,
                  fontweight: FontWeight.w800,
                  color: Appcolors.yellow),
              ontap: () => Navigator.pushNamedAndRemoveUntil(
                  context, RouteName.bottomnav, (route) => false),
            ),
            SizedBox(height: size.height * 0.025),
          ],
        ),
      ),
    );
  }
}
