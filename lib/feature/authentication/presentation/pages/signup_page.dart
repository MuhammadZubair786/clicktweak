// import 'package:craftman/config/page%20route/detail/route_name.dart';
// import 'package:craftman/features/authentication/presentation/bloc/cubit/auth_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../constants/export.dart';
// import '../../../splash_onboarding/data/local/onboarding_Images.dart';
// import '../src/auth_widgets_export.dart';

// class SignupPage extends StatelessWidget {
//   const SignupPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.sizeOf(context);

//     return BlocListener<AuthCubit, AuthState>(
//       listener: (context, state) {
//         if (state is AuthTokenSentState) {
//           Navigator.pushNamed(context, RouteName.mobileOtp);
//         }
//       },
//       child: AppScaffold(
//         color: Appcolors.blue,
//         body: Column(children: [
//           Expanded(
//               child: Container(
//             padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
//             width: size.width,
//             color: Appcolors.white,
//             child: SingleChildScrollView(
//               controller: ScrollController(),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: size.height * 0.02),
//                   AppText(
//                       text: 'Signup',
//                       fontweight: FontWeight.w800,
//                       color: Appcolors.blue,
//                       size: 30),
//                   SizedBox(height: size.height * 0.01),
//                   AppText(
//                       text: 'Create New Account',
//                       fontweight: FontWeight.w600,
//                       color: Appcolors.blue),
//                   AppText(
//                       text: 'Complete form to create new account',
//                       size: 16,
//                       color: Appcolors.lightgrey),
//                   SizedBox(height: size.height * 0.01),
//                   const SignupFirstnameAndLastnameTextefield(),
//                   SizedBox(height: size.height * 0.025),
//                   const SignupEmailTextfield(),
//                   SizedBox(height: size.height * 0.025),
//                   const SignupPhoneTextField(),
//                   SizedBox(height: size.height * 0.025),
//                   const SignupPasswodtTextfield(),
//                   SizedBox(height: size.height * 0.025),
//                   const SigupTermsAndCondition(),
//                   SizedBox(height: size.height * 0.04),
//                   const SignupButton(),
//                   SizedBox(height: size.height * 0.02),
//                   SignupOrLogin(
//                       ontap: () {
//                         Navigator.pushNamed(context, RouteName.login);
//                       },
//                       subTitle: 'Login',
//                       title: 'Already have an account?'),
//                   SizedBox(height: size.height * 0.04),
//                   Image.asset(OnboardingImages.splash,
//                       height: size.height * 0.15, width: size.width * 0.9),
//                 ],
//               ),
//             ),
//           ))
//         ]),
//       ),
//     );
//   }
// }
