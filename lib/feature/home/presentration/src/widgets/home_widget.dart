import 'package:clicktwaek/feature/splash_onboarding/data/local/onboarding_images.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../config/page route/page_route.dart';
import '../../../../../constants/export.dart';
import '../../../data/home_images.dart';

class HomePlan extends StatefulWidget {
  const HomePlan({super.key});

  @override
  State<HomePlan> createState() => _HomePlanState();
}

class _HomePlanState extends State<HomePlan> {

@override
void initState(){
  super.initState();
  getCurrentEarn();
}

var earn_plan ="0";
getCurrentEarn() async {
   final firestore = FirebaseFirestore.instance;
     var _preferences = await SharedPreferences.getInstance();
     var planId=     _preferences.getString("planId");
DocumentSnapshot planDoc = await firestore.collection('Plans').doc(planId).get();

if (planDoc.exists) {
  var plans = planDoc.data() as Map<String, dynamic>?;

  if (plans != null && plans.containsKey("earn_per_video") && plans["earn_per_video"] != null) {
   earn_plan  = plans["earn_per_video"].toString();
  } else {
    // Handle the case where "earn_per_video" is not present or has a null value
    earn_plan = "0"; // Replace "Default Value" with your desired default value
  }
} else {
  // Handle the case where the document with the given planId does not exist
  earn_plan = "0"; // Replace "Default Value" with your desired default value
}
}
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Row(
        children: [
          AppText(
              text: 'Plan \$${earn_plan.toString()}',
              size: 20,
              fontweight: FontWeight.w600,
              color: Appcolors.blackColor),
          SizedBox(width: size.width * 0.035),
          Image.asset(
            'assets/home/property.png',
            color: Appcolors.blackColor,
          ),
          Expanded(child: Container()),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, RouteName.allVideos),
            child: AppText(
                text: 'See all',
                size: 16,
                fontweight: FontWeight.w500,
                color: Appcolors.blue),
          )
        ],
      ),
    );
  }
}

class HomeProgressIndicator extends StatelessWidget {
  const HomeProgressIndicator({Key? key, this.bgColor}) : super(key: key);

  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Stack(
        alignment: Alignment.center,
        children: [
          LinearProgressIndicator(
            // semanticsLabel: ,
            borderRadius: BorderRadius.circular(size.width * 0.02),
            minHeight: size.height * 0.02,
            value: 0.5,
            valueColor: AlwaysStoppedAnimation(Appcolors.green),
            backgroundColor: bgColor ?? Appcolors.redColor,
          ),
          Text(
            '0 of 4',
            style: TextStyle(
              color: Appcolors.yellow, // Set text color as needed
              fontSize: 16.0, // Set font size as needed
              fontWeight: FontWeight.bold, // Set font weight as needed
            ),
          ),
        ],
      ),
    );
  }
}

class HomeVideo extends StatefulWidget {
  var data;
   HomeVideo({super.key, this.ontap,this.data});
  final Function()? ontap;

  @override
  State<HomeVideo> createState() => _HomeVideoState();
}

class _HomeVideoState extends State<HomeVideo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.data);
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
  onTap: widget.ontap,
  child: Container(
    width: size.width,
    height: size.height * 0.25,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(widget.data["poster"]),
        fit: BoxFit.cover,
      ),
    ),
    child: Stack(
      children: [
        // Video Frame
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.3), // Adjust opacity as needed
            child: Center(
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 50.0, // Adjust the size of the play button
              ),
            ),
          ),
        ),
        // Additional elements can be added on top of the video frame
      ],
    ),
  ),
);

  }
}


class HomeVideoSellAll extends StatefulWidget {
  var data;
   HomeVideoSellAll({super.key, this.ontap,this.data});
  final Function()? ontap;

  @override
  State<HomeVideo> createState() => _HomeVideoState();
}

class _HomeVideoSellAllState extends State<HomeVideo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.data.data());
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
  onTap: widget.ontap,
  child: Container(
    width: size.width,
    height: size.height * 0.25,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(widget.data.data()["poster"]),
        fit: BoxFit.cover,
      ),
    ),
    child: Stack(
      children: [
        // Video Frame
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.3), // Adjust opacity as needed
            child: Center(
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 50.0, // Adjust the size of the play button
              ),
            ),
          ),
        ),
        // Additional elements can be added on top of the video frame
      ],
    ),
  ),
);

  }
}

class HomeBalance extends StatefulWidget {
  const HomeBalance({super.key});

  @override
  State<HomeBalance> createState() => _HomeBalanceState();
}

class _HomeBalanceState extends State<HomeBalance> {



void initState(){
  super.initState();
  getData();
}

var Earn = "0";
var Balance;


getData() async {
    var _preferences = await SharedPreferences.getInstance();
     Earn =   _preferences.getString("totalEarning")!;
     double? balanceDouble = _preferences.getDouble("Balance");
 Balance = balanceDouble?.toString() ?? '0.0';
setState(() {
  
});

          
}


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.width * 0.03),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(HomeImages.balance),
        ),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.020),
              Image.asset(HomeImages.wlogo),
              SizedBox(height: size.height * 0.015),
              AppText(
                size: 28,
                text: ' Total Balance',
                fontweight: FontWeight.w600,
                color: Appcolors.white,
              ),
               AppText(
                size: 32,
                text: ' \$${Balance}',
                fontweight: FontWeight.w800,
                color: Appcolors.white,
              ),
             
             
              SizedBox(height: size.height * 0.01),
              AppText(
                size: 20,
                text: ' Total Earned \$${Earn.toString()}',
                color: Appcolors.white,
              ),
              SizedBox(height: size.height * 0.03),
            ],
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset(HomeImages
                .wlogo2), // Replace 'path_to_second_image' with the actual path
          ),
        ],
      ),
    );
  }
}

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key, this.ontap});

  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return AppshadowContainer(
      padding: EdgeInsets.symmetric(
          vertical: size.width * 0.02, horizontal: size.width * 0.03),
      radius: 0,
      shadowcolour: Appcolors.white,
      color: Appcolors.redColor,
      child: Row(
        children: [
          GestureDetector(onTap: ontap, child: Image.asset(HomeImages.wlogo)),
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

class HomeAppbar2 extends StatelessWidget {
  const HomeAppbar2({super.key, this.ontap, required this.userDoc});

  final Function()? ontap;
  final Map<String, dynamic> userDoc;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return AppshadowContainer(
      padding: EdgeInsets.symmetric(
          vertical: size.width * 0.02, horizontal: size.width * 0.03),
      radius: 0,
      shadowcolour: Appcolors.white,
      color: Appcolors.redColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                  onTap: ontap, child: Image.asset(HomeImages.wlogo)),
              SizedBox(width: size.width * 0.025),
              AppText(
                  size: 20,
                  text: 'ClickTweak',
                  fontweight: FontWeight.w900,
                  color: Appcolors.white),
            ],
          ),
          CircleAvatar(
              radius: 30.sp,
              backgroundImage: NetworkImage(userDoc['avatar'] ?? ''))
        ],
      ),
    );
  }
}

// class NavDrawer extends StatelessWidget {
//   const NavDrawer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.sizeOf(context);
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           DrawerHeader(
//               decoration: BoxDecoration(color: Appcolors.redColor),
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CircleAvatar(radius: 30.sp),
//                     SizedBox(height: size.height * 0.015),
//                     AppText(
//                         text: 'Suh Desmond',
//                         size: 15,
//                         fontweight: FontWeight.w900,
//                         color: Appcolors.white),
//                     AppText(
//                         text: 'desmon454@gmail.com',
//                         size: 13,
//                         color: Appcolors.yellow)
//                   ])),
//           const SideBarInfo(icon: Icons.ac_unit, title: 'Deposit'),
//           const SideBarInfo(icon: Icons.ac_unit, title: 'Plans'),
//           const SideBarInfo(icon: Icons.ac_unit, title: 'Mining'),
//           SideBarInfo(
//               icon: Icons.support_agent,
//               title: 'Support',
//               ontap: () => Navigator.pushNamed(context, RouteName.support)),
//           Divider(color: Appcolors.blackColor),
//           const AppText(
//               text: 'Settings', size: 14, fontweight: FontWeight.w500),
//           const SideBarInfo(
//               icon: Icons.switch_access_shortcut, title: 'Language '),
//           Divider(color: Appcolors.blackColor),
//           const AppText(
//               text: 'Communicate ', size: 14, fontweight: FontWeight.w500),
//           SideBarInfo(
//               icon: Icons.no_accounts,
//               title: 'Invite friends',
//               ontap: () => Navigator.pushNamed(context, RouteName.refer)),
//           const SideBarInfo(icon: Icons.ac_unit, title: 'Community '),
//           const SideBarInfo(icon: Icons.star, title: 'Rate us '),
//           Divider(color: Appcolors.blackColor),
//           const AppText(text: 'Account', size: 14, fontweight: FontWeight.w500),
//           const SideBarInfo(icon: Icons.headset_off, title: 'Log Out'),
//           const SideBarInfo(icon: Icons.star, title: 'privacy Policy'),
//         ],
//       ),
//     );
//   }
// }

class SideBarInfo extends StatelessWidget {
  const SideBarInfo(
      {super.key, required this.title, required this.icon, this.ontap});
  final String title;
  final Widget icon;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: AppText(text: title, size: 14, fontweight: FontWeight.w500),
      onTap: ontap,
    );
  }
}
