import 'package:clicktwaek/feature/plans/presentation/bloc/cubit/plans_cubit.dart';
import 'package:clicktwaek/feature/withdraw/presentation/bloc/cubit/withdraw_cubit.dart';
import 'package:clicktwaek/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/page route/page_route.dart';
import 'feature/home/presentration/src/utils.dart';
import 'feature/splash_onboarding/presentation/bloc/cubit/onboarding_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top]);
  await ClickDs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnboardingCubit()),
        BlocProvider(create: (context) => PlansCubit()),
        BlocProvider(create: (context) => WithdrawCubit()),
        // BlocProvider(create: (context) => AccountCubit()),
      ],
      child: ScreenUtilInit(
          minTextAdapt: true,
          splitScreenMode: true,
          designSize: MediaQuery.sizeOf(context),
          builder: (context, child) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Craftman',
                theme: ThemeData(
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                initialRoute: RouteName.splash,
                onGenerateRoute: AppRoute.onGeneratedRoute);
          }),
    );
  }
}
