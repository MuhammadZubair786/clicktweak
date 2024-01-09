// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../config/page route/detail/route_name.dart';
// import '../../../../constants/appcolors.dart';
// import '../../../../constants/appscaffold.dart';
// import '../../../../constants/apptext.dart';
// import '../../../splash_onboarding/data/local/onboarding_Images.dart';
// import '../bloc/cubit/auth_cubit.dart';
// import '../src/auth_widgets_export.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.sizeOf(context);
//     final readAuthCubit = context.read<AuthCubit>();
//     final watchAuthCubit = context.watch<AuthCubit>();
//     return AppScaffold(
//       color: Appcolors.blue,
//       body: Column(children: [
//         Expanded(
//             child: Container(
//           padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
//           width: size.width,
//           color: Appcolors.white,
//           child: SingleChildScrollView(
//             controller: ScrollController(),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: size.height * 0.02),
//                 AppText(
//                     text: 'Login',
//                     fontweight: FontWeight.w800,
//                     color: Appcolors.blue,
//                     size: 30),
//                 SizedBox(height: size.height * 0.01),
//                 AppText(
//                     text: 'Welcome  Back!',
//                     fontweight: FontWeight.w600,
//                     color: Appcolors.blue),
//                 AppText(
//                     text: 'Login to cotinue',
//                     color: Appcolors.lightgrey,
//                     size: 16),
//                 SizedBox(height: size.height * 0.02),
//                 AuthTextfield(
//                     controller: watchAuthCubit.emailController,
//                     keyboardtype: TextInputType.emailAddress,
//                     validator: (value) {
//                       return null;
//                     },
//                     prefixicon: Icon(Icons.email_outlined, size: 25.sp),
//                     hintext: 'Email'),
//                 SizedBox(height: size.height * 0.03),
//                 AuthTextfield(
//                     controller: watchAuthCubit.passwordController,
//                     obscure: watchAuthCubit.showPassword,
//                     validator: (value) {
//                       return null;
//                     },
//                     suffixicon: InkWell(
//                         onTap: () {
//                           readAuthCubit.changeShowpassword();
//                         },
//                         child: Icon(
//                             watchAuthCubit.showPassword
//                                 ? Icons.visibility
//                                 : Icons.visibility_off,
//                             size: 22.sp)),
//                     prefixicon: Icon(Icons.lock_outline, size: 25.sp),
//                     hintext: 'Password'),
//                 SizedBox(height: size.height * 0.025),
//                 Align(
//                     alignment: Alignment.centerRight,
//                     child: AppText(
//                         text: 'Forget Password?',
//                         size: 14,
//                         color: Appcolors.blue,
//                         fontweight: FontWeight.w700)),
//                 SizedBox(height: size.height * 0.02),
//                 Terms(
//                     ontap: () {
//                       readAuthCubit.changeStaylogin();
//                     },
//                     size: size,
//                     title: 'Stay Loged In ',
//                     status: watchAuthCubit.stayLogin),
//                 SizedBox(height: size.height * 0.04),
//                 AuthButton(
//                     isloading: watchAuthCubit.state is AuthLoadingState,
//                     width: size.width,
//                     height: size.width * 0.13,
//                     radius: size.width * 0.03,
//                     ontap: () {},
//                     child: AppText(
//                         text: 'Login',
//                         color: Appcolors.white,
//                         fontweight: FontWeight.w700,
//                         size: 20)),
//                 SizedBox(height: size.height * 0.02),
//                 SignupOrLogin(
//                     ontap: () {
//                       Navigator.pushNamed(context, RouteName.signup);
//                     },
//                     subTitle: 'Signup',
//                     title: 'Don\'t have an account?'),
//                 SizedBox(height: size.height * 0.08),
//                 Image.asset(OnboardingImages.splash,
//                     height: size.height * 0.15, width: size.width * 0.9),
//               ],
//             ),
//           ),
//         ))
//       ]),
//     );
//   }
// }
