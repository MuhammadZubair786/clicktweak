import 'package:clicktwaek/constants/app_button.dart';
import 'package:clicktwaek/constants/appcolors.dart';
import 'package:clicktwaek/constants/appscaffold.dart';
import 'package:clicktwaek/constants/apptext.dart';
import 'package:clicktwaek/feature/plans/presentation/pages/plans_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        backGroundColor: Appcolors.white,
        color: Appcolors.redColor,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBarWithArrowAndIcon(),
              SizedBox(height: size.height * 0.15),
              const SuportProfile(),
              SizedBox(height: size.height * 0.04),
              const AppText(
                  text: '    Massage', size: 16, fontweight: FontWeight.w500),
              SizedBox(height: size.height * 0.01),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  child: const TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                          hintText: 'Type your message here',
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0x191B2A3B)))))),
              SizedBox(height: size.height * 0.28),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                child: AppButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.navigation,
                          color: Appcolors.yellow, size: 25.sp),
                      AppText(
                          text: '  Send message',
                          size: 14,
                          color: Appcolors.yellow,
                          fontweight: FontWeight.w500)
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class SuportProfile extends StatelessWidget {
  const SuportProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Row(
        children: [
          CircleAvatar(backgroundColor: Appcolors.redColor, radius: 50),
          SizedBox(width: size.width * 0.03),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppText(
                  text: 'Reem Khaled', size: 14, fontweight: FontWeight.w500),
              AppText(
                  text: 'reem_1993@gmail.com',
                  size: 14,
                  color: Appcolors.blackColor.withOpacity(0.5),
                  fontweight: FontWeight.w500)
            ],
          )
        ],
      ),
    );
  }
}
