import 'package:clicktwaek/constants/app_button.dart';
import 'package:clicktwaek/constants/appcolors.dart';
import 'package:clicktwaek/constants/appscaffold.dart';
import 'package:clicktwaek/constants/appshadowcontainer.dart';
import 'package:clicktwaek/constants/apptext.dart';
import 'package:clicktwaek/feature/home/data/home_images.dart';
import 'package:clicktwaek/feature/home/presentration/src/home_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:social_share/social_share.dart';

class Refer extends StatelessWidget {
  const Refer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return  SafeArea(
      child: AppScaffold(
          backGroundColor: Appcolors.white,
          color: Appcolors.redColor,
          body: Column(
            children: [
              HomeReferAppbar(),
              SizedBox(height: size.height * 0.07),
              CircleAvatar(
                  radius: 70.sp,
                  backgroundColor: Appcolors.blackColor.withOpacity(0.2),
                  child: Image.asset(HomeImages.box)),
              SizedBox(height: size.height * 0.02),
              const AppText(
                  text: 'Refer & Earn', size: 22, fontweight: FontWeight.w700),
              SizedBox(height: size.height * 0.02),
              const AppText(
                  textalign: TextAlign.center,
                  size: 16,
                  text:
                      'Share this code with your friends and\nearn when they join'),
              SizedBox(height: size.height * 0.075),
              const ReferalCode(),
              SizedBox(height: size.height * 0.21),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                child: AppButton(
                  ontap: (){
                    SocialShare.shareOptions("play Store Link ").then((data) {
                              print(data);
                            });
                  },
                  child: AppText(
                      text: 'Invite friends ',
                      size: 14,
                      fontweight: FontWeight.w700,
                      color: Appcolors.yellow),
                ),
              )
            ],
          )),
    );
  }
}

class HomeReferAppbar extends StatelessWidget {
  const HomeReferAppbar({super.key, this.ontap});

  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return AppshadowContainer(
      height: 50,
      padding: EdgeInsets.symmetric(
          vertical: size.width * 0.02, horizontal: size.width * 0.03),
      radius: 0,
      shadowcolour: Appcolors.white,
      color: Appcolors.redColor,
      child: Row(
        children: [
          GestureDetector(onTap: (){
            Navigator.pop(context);
          }, child: Icon(Icons.arrow_back,color: Colors.white,)),
          SizedBox(width: size.width * 0.025),
          AppText(
              size: 20,
              text: 'ClickTweak',
              fontweight: FontWeight.w900,
              color: Appcolors.white),
        ],
      ),
    );
  }
}


class ReferalCode extends StatefulWidget {
  const ReferalCode({super.key});

  @override
  State<ReferalCode> createState() => _ReferalCodeState();
}

class _ReferalCodeState extends State<ReferalCode> {

void initState(){
  super.initState();
  getCode();
}
var code ="";

getCode() async {
     var _preferences = await SharedPreferences.getInstance();
     code =   _preferences.getString("inviteCode")!;
     setState(() {
       
     });
}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppshadowContainer(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.055),
      padding: EdgeInsets.symmetric(vertical: size.height * 0.015),
      color: const Color(0xFFF0FEF9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           AppText(
              text: code.toString().toUpperCase() , size: 16, fontweight: FontWeight.w600),
          SizedBox(width: size.width * 0.075),
          GestureDetector(
            onTap: () async {
                await Clipboard.setData(ClipboardData(text: code.toString()));
                
            },
            child: Row(
              children: [
                Icon(Icons.copy, color: Appcolors.blue, size: 25.sp),
                AppText(
                    text: '  Copy Code',
                    size: 14,
                    color: Appcolors.blue,
                    fontweight: FontWeight.w700)
              ],
            ),
          )
        ],
      ),
    );
  }
}
