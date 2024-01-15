// ignore_for_file: prefer_const_constructors

import 'package:clicktwaek/constants/appcolors.dart';
import 'package:clicktwaek/constants/appscaffold.dart';
import 'package:clicktwaek/feature/home/presentration/src/home_exports.dart';
import 'package:clicktwaek/feature/plans/presentation/pages/plans_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../splash_onboarding/presentation/bloc/cubit/onboarding_cubit.dart';

class AllVideos extends StatefulWidget {
  const AllVideos({super.key});

  @override
  State<AllVideos> createState() => _AllVideosState();
}

class _AllVideosState extends State<AllVideos> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getVideos();
  }

  var videoList = [];

  getVideos() async {
    final firestore = FirebaseFirestore.instance;
    var data =
        await FirebaseFirestore.instance.collection("Youtube_Videos").get();
    var maindata = data.docs;

    for (var i = 0; i < maindata.length; i++) {
      videoList.add(maindata[i].data());
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
      backGroundColor: Appcolors.white,
      color: Appcolors.redColor,
      body: Column(
        children: [
          const AppBarWithArrowAndIcon(),
          SizedBox(height: size.height * 0.015),
          videoList.length == 0
              ? 
               Center(
     child: CircularProgressIndicator(
       valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
       strokeWidth: 8.0,
     ),)
              : Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      print(videoList[index]);
                      return Padding(
                        padding: EdgeInsets.only(bottom: size.width * 0.02),
                        child: GestureDetector(
                          onTap: (){
                            print( videoList[index]["Youtube_Link"]);
                              lauchyoutube(
                      youtube:
                       videoList[index]["Youtube_Link"]);

                          },
                          child: Container(
                            width: size.width,
                            height: size.height * 0.25,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(videoList[index]["poster"]),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Stack(
                              children: [
                                // Video Frame
                                Positioned.fill(
                                  child: Container(
                                    color: Colors.black.withOpacity(
                                        0.3), // Adjust opacity as needed
                                    child: Center(
                                      child: Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                        size:
                                            50.0, // Adjust the size of the play button
                                      ),
                                    ),
                                  ),
                                ),
                                // Additional elements can be added on top of the video frame
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }

  lauchyoutube({required String youtube}) async {
    final video = Uri.parse(youtube);
    if (await canLaunchUrl(video)) {
      launchUrl(video);
    } else {
      throw 'Could not launch $video';
    }
  }
}
