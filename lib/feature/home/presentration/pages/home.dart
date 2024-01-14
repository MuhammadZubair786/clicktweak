import 'package:clicktwaek/config/page%20route/detail/route_name.dart';
import 'package:clicktwaek/constants/export.dart';
import 'package:clicktwaek/feature/home/presentration/pages/input_video_code.dart';
import 'package:clicktwaek/feature/splash_onboarding/presentation/bloc/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:clicktwaek/feature/home/presentration/src/widgets/home_widget.dart';
import '../src/home_exports.dart';
import '../src/widgets/navigationDrawer.dart';

class HomePage extends StatefulWidget {
    final GlobalKey<ScaffoldState> scaffoldKey;
   HomePage({super.key,required this.scaffoldKey});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userDoc = <String, dynamic>{};
  // YoutubePlayerController _ytbPlayerController =
  //     YoutubePlayerController(initialVideoId: '');
  // List<YoutubeVideo> videosLink = [];

  // _setOrientation(List<DeviceOrientation> orientations) {
  //   SystemChrome.setPreferredOrientations(orientations);
  // }
  bool _getCodebutton = false;

  @override
  void initState() {
    getData();
    getyoutubegData();
    // _setOrientation([
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    super.initState();
  }

  void getData() async {
    await context.read<OnboardingCubit>().getUserData();
    userDoc = context.read<OnboardingCubit>().userDoc;
  }

  void getyoutubegData() async {
    await context.read<OnboardingCubit>().getvideo();
  }

  @override
  void dispose() {
    super.dispose();

    // _setOrientation([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);

    // _ytbPlayerController?.dispose();
  }

  // Future<bool> _onWillPop() async {

  //   if (await onboardingCubit.isCodeValid()) {
  //     // Show the success dialog
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return const SuccessDialog();
  //       },
  //     );

  //     return true; // Allowing the user to pop the screen
  //   }

  //   return false; // Preventing the user from popping the screen
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    // videosLink = context.read<OnboardingCubit>().videos;
    // _ytbPlayerController = context.read<OnboardingCubit>().ytbPlayerController;

    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(1.h),
              child: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Appcolors.redColor)),
          key: widget.scaffoldKey,
          // drawer: const NavDrawer(),
          backgroundColor: Appcolors.white.withOpacity(0.1),
          body: Column(
            children: [
              HomeAppbar2(
                  ontap: () =>
                   widget.scaffoldKey.currentState!.openDrawer()
                  ,
                  userDoc: userDoc),
              SizedBox(height: size.height * 0.005),
              const HomeBalance(),
              SizedBox(height: size.height * 0.005),
              HomeVideo(
                ontap: () async {
                  // Generate a code
                  final generatedCode =
                      context.read<OnboardingCubit>().generateCode();
    
                  // Set expiration time (for example, 1 hour from now)
                  final expirationTime =
                      DateTime.now().add(const Duration(minutes: 5));
    
                  // Set the code and expiration time in Firebase
                  await context
                      .read<OnboardingCubit>()
                      .setCodeInFirebase(generatedCode, expirationTime);
                  lauchyoutube(
                      youtube:
                          context.read<OnboardingCubit>().videos.last.url!);
                },
              ),
              SizedBox(height: size.height * 0.025),
              _getCodebutton
                  ? TextButton(
                      onPressed: () async {
                        OnboardingCubit onboardingCubit =
                            context.read<OnboardingCubit>();
                        if (await onboardingCubit.isCodeValid()) {
                          var code = await onboardingCubit.getRandomCode();
                          // Show the success dialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SuccessDialog(
                                message: code,
                              );
                            },
                          );
                          setState(() {
                            _getCodebutton = false;
                          });
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return FialedDialog(
                                message: 'Your code is Expire Now',
                              );
                            },
                          );
                          setState(() {
                            _getCodebutton = false;
                          });
                        }
                      },
                      child: Text(
                        'Get Code',
                        style: TextStyle(color: Appcolors.blue),
                      ))
                  : SizedBox.shrink(),
              SizedBox(height: size.height * 0.005),
              const HomeProgressIndicator(),
              SizedBox(height: size.height * 0.005),
              const HomePlan(),
              SizedBox(height: size.height * 0.06),
              AppButton(
                height: 50,
                width: size.width * 0.86,
                child: AppText(
                    text: 'Claim reward ',
                    size: 20,
                    fontweight: FontWeight.w700,
                    color: Appcolors.yellow),
                ontap: () {
                  // Navigate to the desired screen or perform any other actions
                  Navigator.pushNamed(context, RouteName.videoInputCode);
                },
              ),
              // SizedBox(height: size.height * 0.07),
            ],
          )),
    );
  }

  lauchyoutube({required String youtube}) async {
    final video = Uri.parse(youtube);
    if (await canLaunchUrl(video)) {
      launchUrl(video).then((value) async {
        OnboardingCubit onboardingCubit = context.read<OnboardingCubit>();
        await onboardingCubit.isCodeValid().then((value) {
          setState(() {
            _getCodebutton = true;
          });
        });
      });
    } else {
      throw 'Could not launch $video';
    }
  }
}
