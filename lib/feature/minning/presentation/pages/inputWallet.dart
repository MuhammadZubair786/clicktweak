// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:clicktwaek/feature/home/presentration/pages/input_video_code.dart';
import 'package:clicktwaek/feature/home/presentration/src/utils.dart';
import 'package:clicktwaek/feature/home/presentration/src/widgets/navigationDrawer.dart';
import 'package:clicktwaek/feature/minning/presentation/pages/ShowSplash.dart';
import 'package:clicktwaek/feature/plans/presentation/pages/plans_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../constants/export.dart';
import '../../../home/data/home_images.dart';
import '../../../splash_onboarding/data/local/onboarding_Images.dart';
import '../../../splash_onboarding/presentation/pages/referal_code.dart';
import '../../data/local/mining_images.dart';

// ignore: must_be_immutable
class InputWalletS extends StatefulWidget {
  VoidCallback? onSplashFinish;

  InputWalletS({Key? key, this.onSplashFinish}) : super(key: key);

  @override
  State<InputWalletS> createState() => _InputWalletSState();
}

class _InputWalletSState extends State<InputWalletS> {
  Future<void>? splashFuture;

  TextEditingController walletAddres = TextEditingController();


@override
  void initState(){
    super.initState();
    getWalletAddress();
  }

  getWalletAddress()async{
     var _preferences = await SharedPreferences.getInstance();
    walletAddres.text= _preferences.getString("Wallet_Address")!;
    setState(() {
      
    });

  }


  

  Future<void> splashFunction() async {
    await Future.delayed(const Duration(seconds: 5));
    
  }

  @override
  Widget build(BuildContext context) {
    return
        
        AppScaffold(
       
      backGroundColor: Appcolors.white,
      color: Appcolors.blue,
      // drawer: NavDrawer(),
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage("https://img.freepik.com/free-vector/blue-copy-space-digital-background_23-2148821698.jpg?size=626&ext=jpg&ga=GA1.1.1506573534.1703183738&semt=ais",
      
        ), fit: BoxFit.cover)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppBarWithArrowAndIcon(),
            // SizedBox(height: 180,),
            // Divider(color: Appcolors.white, thickness: 2.sp),
            Container(
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  UpdateWallet(size: MediaQuery.of(context).size,controller:walletAddres ),
                 
          //        
          
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


class UpdateWallet extends StatefulWidget {
   UpdateWallet({
    super.key,
    required this.size,
    required this.controller
  });

  final Size size;
  var controller;

  @override
  State<UpdateWallet> createState() => _UpdateWalletState();
}

class _UpdateWalletState extends State<UpdateWallet> {



updateWallet() async {
     var _preferences = await SharedPreferences.getInstance();
var userId =   _preferences.getString("userId");
 _preferences.setString("Wallet_Address", widget.controller.text);


   final firestore = FirebaseFirestore.instance;
    await firestore
        .collection('users')
        .doc(userId)
        .update({"Wallet_Address":widget.controller.text});

}

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      
        Center(
          child: Container(
           
            width: widget.size.width,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(widget.size.width * 0.045),
                    bottomLeft: Radius.circular(widget.size.width * 0.045))),
            child: Column(
              children: [
                  SizedBox(height: 200,),
              
                
              
                SizedBox(height: widget.size.height * 0.01),
                Container(
                  height: widget.size.height * 0.07,
                  width: widget.size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Appcolors.blackColor,
                      borderRadius: BorderRadius.circular(26)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: 
                    TextField(
                      controller: widget.controller,
  style: TextStyle(color: Colors.white), // Set text color to white
  decoration: InputDecoration(
    // filled: true,
    // fillColor: Colors, // Set background color to transparent
    hintText: '          Enter Your Wallet Address', // Placeholder text
    hintStyle: TextStyle(color: Colors.white), // Set placeholder color to white
    // border: OutlineInputBorder(
    //   borderSide: BorderSide(color: Colors.yellow), // Set border color to yellow
    //   borderRadius: BorderRadius.circular(10.0), // Adjust border radius as needed
    // ),
  ),
)
                  ),
                ),
                SizedBox(height: widget.size.height * 0.03),
                Container(
                   height: widget.size.height * 0.07,
                  width: widget.size.width * 0.9,
                  child: ElevatedButton(
                  onPressed: () {
                    updateWallet();
                    // Handle button press
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white, // Set background color to transparent
                    onPrimary: Appcolors.blue, // Set text color to white
                    elevation: 3, // Add elevation for a subtle shadow effect
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Appcolors.blue), // Set border color to yellow
                      borderRadius: BorderRadius.circular(30.0), // Adjust border radius as needed
                    ),
                  ),
                  child: Text('Update Wallet'),
                ),
                ),
                SizedBox(height: widget.size.height * 0.01),
              ],
            ),
          ),
        ),
        // Positioned(
        //   top: 10,
        //   right: 0,
        //   bottom: 0,
        //   child: Image.asset(HomeImages
        //       .wlogo2), // Replace 'path_to_second_image' with the actual path
        // ),
      ],
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
      color: Appcolors.blue,
      child: Row(children: [
        GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back, size: 35.sp, color: Appcolors.white)),
        SizedBox(width: size.width * 0.20),
        Center(
          child: AppText(
              size: 20,
              text: '       Wallet  ',
              fontweight: FontWeight.w900,
              color: Appcolors.white),
        )
      ]),
    );
  }
}

