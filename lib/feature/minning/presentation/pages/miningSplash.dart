// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:clicktwaek/feature/home/presentration/pages/input_video_code.dart';
import 'package:clicktwaek/feature/home/presentration/src/utils.dart';
import 'package:clicktwaek/feature/home/presentration/src/widgets/navigationDrawer.dart';
import 'package:clicktwaek/feature/minning/presentation/pages/ShowSplash.dart';
import 'package:clicktwaek/feature/minning/presentation/pages/inputWallet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/export.dart';
import '../../../home/data/home_images.dart';
import '../../../splash_onboarding/data/local/onboarding_Images.dart';
import '../../../splash_onboarding/presentation/pages/referal_code.dart';
import '../../data/local/mining_images.dart';

// ignore: must_be_immutable
class MiningSplash extends StatefulWidget {
  VoidCallback? onSplashFinish;

  MiningSplash({Key? key, this.onSplashFinish}) : super(key: key);

  @override
  State<MiningSplash> createState() => _MiningSplashState();
}

class _MiningSplashState extends State<MiningSplash> {
  Future<void>? splashFuture;
  var counter = "";

  Duration initialDuration = Duration(hours: 0);

  @override
  void initState() {
    super.initState();
    getCounter();
    //     Timer.periodic(Duration(seconds: 1), (Timer timer) {
    //       SetCounter();
    // });
    // splashFuture = splashFunction();
  }

  getCounter() async {
    final firestore = FirebaseFirestore.instance;
    DocumentSnapshot<Map<String, dynamic>> getdata = await firestore
        .collection('Counter_Mining')
        .doc("j1a3RD3hlewYXpoKmdES")
        .get();
    if (getdata.exists) {
      // counter = getdata.data()!["timer"];
      initialDuration = Duration(
          hours:
              int.parse(getdata.data()!["timer"].toString().substring(0, 2)));
      Timer.periodic(Duration(seconds: 1), (Timer timer) async {
        if (initialDuration.inSeconds > 0) {
          initialDuration -= Duration(seconds: 1);
          // counter =initialDuration.toString();
          formatDuration(initialDuration).toString();
        } else {
            await firestore
        .collection('Counter_Mining')
        .doc("j1a3RD3hlewYXpoKmdES")
        .update({"timer":"24:00:00"});
          // timer.cancel();
          print("Countdown finished!");
        }
      });
    }
  }

  formatDuration(duration) async {
    final firestore = FirebaseFirestore.instance;
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    counter =
        "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    await firestore
        .collection('Counter_Mining')
        .doc("j1a3RD3hlewYXpoKmdES")
        .update({"timer": counter.toString()});
    // setState(() {});
  }

  Future<void> splashFunction() async {
    await Future.delayed(const Duration(seconds: 5));
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     var size = MediaQuery.of(context).size;
    //     return AlertDialog(
    //         contentPadding: EdgeInsets.zero,
    //         content: Container(
    //           color: Appcolors.blackColor,
    //           width: size.width,
    //           child: Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Column(
    //               mainAxisSize: MainAxisSize.min,
    //               children: [
    //                 SizedBox(height: size.height * 0.015),
    //                 Image.asset(OnboardingImages.splash),
    //                 SizedBox(height: size.height * 0.015),
    //                 AppText(
    //                     text: 'This Program is under Development',
    //                     fontweight: FontWeight.w800,
    //                     size: 20,
    //                     color: Appcolors.white),
    //                 SizedBox(height: size.height * 0.015),
    //                 const AppText(
    //                     color: Colors.white,
    //                     text: 'You cant mine at this moment',
    //                     size: 20),
    //                 SizedBox(height: size.height * 0.03),
    //                 AppButton(
    //                     buttoncolor: Color(0xFF009381),
    //                     ontap: () {
    //                       Navigator.pop(context);
    //                     },
    //                     width: size.width * 0.45,
    //                     child: AppText(
    //                         text: 'Ok',
    //                         fontweight: FontWeight.w500,
    //                         size: 16,
    //                         color: Appcolors.white)),
    //                 SizedBox(height: size.height * 0.025),
    //               ],
    //             ),
    //           ),
    //         ));
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return
        // FutureBuilder<void>(
        //   future: splashFuture,
        // builder: (context, snapshot) {
        //   if (snapshot.connectionState == ConnectionState.waiting) {
        //     return AppScaffold(
        //       backGroundColor: Appcolors.blue,
        //       color: Appcolors.blue,
        //       body: Center(
        //         child: Image.asset(
        //           OnboardingImages.miningSplash,
        //           height: MediaQuery.of(context).size.height * 0.1,
        //           fit: BoxFit.cover,
        //         ),
        //       ),
        //     );
        //   } else {
        AppScaffold(
      backGroundColor: Appcolors.white,
      color: Appcolors.blue,
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Divider(color: Appcolors.white, thickness: 1.sp,height: 5),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  UpdateWallet(size: MediaQuery.of(context).size),
                  // SizedBox(
                  //     height: MediaQuery.of(context).size.height * 0.01),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.03,
                        vertical: MediaQuery.of(context).size.width * 0.04),
                    child: AppText(
                        color: Appcolors.blackColor,
                        text: 'OVERVIEW',
                        size: 25,
                        fontweight: FontWeight.bold),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.03),
                    decoration: BoxDecoration(
                        color: Appcolors.blue,
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width * 0.03)),
                    // child: Image.asset(MinningImage.frame),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Appcolors.blue,
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.07)),
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //  Image.asset(MinningImage.name),
                          // Text("ROCKIPOINT",),
                          Row(
                            children: [
                              Text("ROCKI",style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w500)),
                              Text("POINT",style: TextStyle(color: Color(0XFF058f88),fontSize: 28,fontWeight: FontWeight.w900)),

                            ],

                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Spacer(),
                              Column(
                                children: [
                                    SizedBox(height: 20,),
                                  Center(
                                      child: Text(
                                    "            Count Down".toUpperCase(),
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 245, 245, 244),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  SizedBox(height: 15,),
                                  Center(
                                      child: Text(
                                    "          ${counter.toString()}",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 240, 240, 237),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900),
                                  )),
                                ],
                              ),
                              Spacer(),
                              Center(
                                  child: CircleAvatar(
                                      radius: 40,
                                      backgroundColor: Colors.transparent,
                                      child: Image.network(
                                          "https://i.postimg.cc/PJpGrnK1/7c87ad0d-6f2c-4416-8f0c-02c5087ec5ee-removebg-preview.png")))
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  'FREEZE COINS = 000000000004',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              // Image.asset(
                              //   'assets/your_image.png', // Replace with your image path
                              //   height: 40.0,
                              //   width: 40.0,
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Container(
                  //   child: Column(
                  //     children: [
                  //       Text("ROCKICON"),
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShowMiningScreen()));
                    },
                    child: Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.03),
                      decoration: BoxDecoration(
                          color: Appcolors.blue,
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.03)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //icon
                          Image.asset(
                            HomeImages.logOut,
                            height: 100,
                            color: Appcolors.white,
                            // fit: BoxFit.contain,
                          ),
                          AppText(
                            text: 'Start Mining',
                            color: Appcolors.white,
                            size: 25.sp,
                            textalign: TextAlign.center,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Image.asset(
                            OnboardingImages.miningSplash,
                            height: 40.sp,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                  )
                
                // ,Center(child: Text("Learn More",))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  //   },
  // );
  // }
}

class CountdownTimer extends StatelessWidget {
  final Duration timeUntilTarget;

  CountdownTimer({required this.timeUntilTarget});

  @override
  Widget build(BuildContext context) {
    int hours = timeUntilTarget.inHours;
    int minutes = (timeUntilTarget.inMinutes % 60);
    int seconds = (timeUntilTarget.inSeconds % 60);

    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(text: '$hours:'),
          TextSpan(
            text: '$minutes:',
            style: TextStyle(color: Colors.yellow), // Highlight minutes
          ),
          TextSpan(text: seconds.toString().padLeft(2, '0')),
        ],
      ),
    );
  }
}

class UpdateWallet extends StatelessWidget {
  const UpdateWallet({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 220,
          width: size.width,
          decoration: BoxDecoration(
              color: Appcolors.blue,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(size.width * 0.045),
                  bottomLeft: Radius.circular(size.width * 0.045))),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppText(
                      text: 'Free',
                      size: 25,
                      color: Appcolors.white,
                      fontweight: FontWeight.w600),
                  SizedBox(width: size.width * 0.02),
                  const Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: AppText(
                        text: 'Mining',
                        size: 16,
                        color: Colors.white,
                        fontweight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.001),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppText(
                      text: 'Current Balance',
                      size: 16,
                      color: Appcolors.white,
                      fontweight: FontWeight.w600),
                  SizedBox(width: size.width * 0.02),
                  Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Icon(
                        Icons.remove_red_eye_outlined,
                        color: Appcolors.white,
                        size: 18,
                      )),
                ],
              ),
              SizedBox(height: size.height * 0.001),
              AppText(
                  text: '0 ROC',
                  size: 25,
                  color: Appcolors.white,
                  fontweight: FontWeight.w600),
              SizedBox(height: size.height * 0.01),
              Container(
                height: size.height * 0.07,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                    color: Color.fromARGB(0, 0, 0, 0).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(26)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppText(
                          text: 'Mining Speed',
                          size: 15,
                          color: Appcolors.white,
                          fontweight: FontWeight.w600),
                      SizedBox(width: size.width * 0.02),
                      AppText(
                          text: '2.45 m/h',
                          size: 15,
                          color: Appcolors.lightGreen,
                          fontweight: FontWeight.w500),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
             GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>InputWalletS()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      border:
                          Border(top: BorderSide(color: Appcolors.lightgrey))),
                  child: AppText(
                      text: 'Connect With Wallet Adress',
                      size: 14,
                      fontweight: FontWeight.w500,
                      color: Appcolors.white),
                ),
              ),
              SizedBox(height: size.height * 0.01),
            ],
          ),
        ),
        Positioned(
          top: 40,
          
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>InputWalletS()));
            },
            child: Image.asset(HomeImages
                .wlogo2,
                width: 300,
                height: 200,
                fit: BoxFit.cover),
          ), // Replace 'path_to_second_image' with the actual path
        ),
      ],
    );
  }
}
