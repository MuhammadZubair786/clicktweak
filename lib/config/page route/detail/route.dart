import 'package:clicktwaek/feature/home/presentration/pages/all_videos.dart';
import 'package:clicktwaek/feature/home/presentration/pages/input_video_code.dart';

import 'package:clicktwaek/feature/home/presentration/pages/refer.dart';
import 'package:clicktwaek/feature/home/presentration/pages/support.dart';
import 'package:clicktwaek/feature/minning/presentation/pages/minning.dart';
import 'package:clicktwaek/feature/plans/presentation/pages/plans_details.dart';
import 'package:clicktwaek/feature/splash_onboarding/presentation/pages/bottomnav.dart';
import 'package:clicktwaek/feature/splash_onboarding/presentation/pages/onboarding1.dart';
import 'package:flutter/cupertino.dart';
import '../../../feature/minning/presentation/pages/miningSplash.dart';
import '../../../feature/splash_onboarding/presentation/pages/referal_code.dart';
import '../../../feature/splash_onboarding/presentation/pages/splash_screen.dart';
import '../page_route.dart';

class AppRoute {
  static Route onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return CustomPageRoute(child: const SplashScreen());
      case RouteName.firstonboarding:
        return CustomPageRoute(child: const FirstOnboard());
      case RouteName.bottomnav:
        return CustomPageRoute(child: const BottomNav());
      case RouteName.planDetail:
        return CustomPageRoute(child: const PlansDetails());

      case RouteName.refer:
        return CustomPageRoute(child: const Refer());
      case RouteName.miningSplash:
        return CustomPageRoute(child: MiningSplash());
      // case RouteName.miningScreen:
      //   return CustomPageRoute(child: const Minning());
      case RouteName.support:
        return CustomPageRoute(child: const Support());

      case RouteName.allVideos:
        return CustomPageRoute(child: const AllVideos());
      case RouteName.referCodeInput:
        return CustomPageRoute(child: const ReferalCodeInput());
      case RouteName.videoInputCode:
        return CustomPageRoute(child: const VideoCode());

      default:
        return CustomPageRoute(child: const SplashScreen());
    }
  }
}
