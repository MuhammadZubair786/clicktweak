// ignore_for_file: use_build_context_synchronously

import 'package:clicktwaek/constants/appcolors.dart';
import 'package:clicktwaek/constants/appscaffold.dart';
import 'package:clicktwaek/feature/minning/presentation/pages/miningSplash.dart';
import 'package:flutter/material.dart';

import '../../../splash_onboarding/data/local/onboarding_images.dart';

class ShowMiningScreen extends StatefulWidget {
  const ShowMiningScreen({super.key});

  @override
  State<ShowMiningScreen> createState() => _ShowMiningScreenState();
}



class _ShowMiningScreenState extends State<ShowMiningScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashFunction();
    
  }

  
   Future<void> splashFunction() async {
     await Future.delayed(const Duration(seconds: 5));

    // Show an alert dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Failed to Connect'),
          content: Text('This Program is Under Developement . You Can not Mine at this Moment'),
          actions: [
            TextButton(
              onPressed: () {
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MiningSplash()));
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
            backGroundColor: Appcolors.blue,
            color: Appcolors.blue,
            body: Center(
              child: Image.asset(
                OnboardingImages.miningSplash,
                height: MediaQuery.of(context).size.height * 0.1,
                fit: BoxFit.contain,
              ),
            ),
          );
  }
}