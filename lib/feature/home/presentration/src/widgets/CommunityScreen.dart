import 'package:clicktwaek/constants/appcolors.dart';
import 'package:clicktwaek/constants/appscaffold.dart';
import 'package:clicktwaek/constants/appshadowcontainer.dart';
import 'package:clicktwaek/constants/apptext.dart';
import 'package:clicktwaek/feature/home/presentration/src/widgets/navigationDrawer.dart';
import 'package:clicktwaek/feature/minning/presentation/pages/inputWallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../authentication/presentation/src/widget/authbutton.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  var WhatsappLink = "https://chat.whatsapp.com/Gwq6wm8uiQ2H0T4SYmvtt3";
  var telegramLink = "https://t.me/+zfRslSohBVNlNzc8";
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        color: Colors.red,
        drawer: NavDrawer(),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppBarWithArrowAndIcon(),
            SizedBox(
              height: 200,
            ),
            Column(
              children: [
                Center(
                  child: AuthButton(
                    child: Text(
                      "Open Whatsapp",
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    radius: 30,
                    buttoncolor: Appcolors.redColor,
                    ontap: () async {
                      if (await canLaunch(WhatsappLink)) {
                        await launch(WhatsappLink);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Could not launch $WhatsappLink')),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: AuthButton(
                    buttoncolor: Appcolors.redColor,
                    child: Text(
                      "Open Telegram",
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    radius: 30,
                    ontap: () async {
                      if (await canLaunch(telegramLink)) {
                        await launch(telegramLink);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Could not launch $WhatsappLink')),
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ],
        ),
        backGroundColor: Colors.white);
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
        SizedBox(width: size.width * 0.10),
        Center(
          child: AppText(
              size: 20,
              text: 'Community Groups  ',
              fontweight: FontWeight.w900,
              color: Appcolors.white),
        )
      ]),
    );
  }
}
