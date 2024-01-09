import 'package:clicktwaek/config/page%20route/detail/route_name.dart';
import 'package:clicktwaek/constants/export.dart';
import 'package:clicktwaek/feature/plans/presentation/bloc/cubit/plans_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home/data/home_images.dart';
import '../../../home/presentration/src/widgets/navigationDrawer.dart';

class Plans extends StatefulWidget {
  const Plans({super.key});

  @override
  State<Plans> createState() => _PlansState();
}

class _PlansState extends State<Plans> {
    GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        backGroundColor: Appcolors.white,
        color: Appcolors.redColor,
         drawer: const NavDrawer(),
        body: Column(
          children: [
             PlansAppbar(
              data:scaffolKey
            ),
            SizedBox(height: size.height * 0.02),
            context.watch<PlansCubit>().planFilter == 'PLANS'
                ? const AllPlans()
                : const YourPlans()
          ],
        ));
  }
}

class YourPlans extends StatelessWidget {
  const YourPlans({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppshadowContainer(
      padding: EdgeInsets.symmetric(
          vertical: size.width * 0.02, horizontal: size.width * 0.03),
      radius: size.width * 0.02,
      margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.03, vertical: size.height * 0.005),
      shadowcolour: Appcolors.white,
      color: Appcolors.blackColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const AppText(
                text: 'FREE PLAN',
                size: 16,
                fontweight: FontWeight.w900,
                color: Color(0xFFB9B9B9)),
            SizedBox(height: size.height * 0.003),
            const AppText(
                text: 'Price',
                size: 16,
                fontweight: FontWeight.w700,
                color: Color(0xFFB9B9B9)),
            SizedBox(height: size.height * 0.002),
            const AppText(
                text: '\$0',
                size: 16,
                fontweight: FontWeight.w700,
                color: Color(0xFFB9B9B9)),
            SizedBox(height: size.height * 0.002),
            const AppText(
                text: 'Earnings per day',
                size: 16,
                fontweight: FontWeight.w700,
                color: Color(0xFFB9B9B9)),
            SizedBox(height: size.height * 0.002),
            const AppText(
                text: '\$0.083/\$10',
                size: 16,
                fontweight: FontWeight.w700,
                color: Color(0xFFB9B9B9))
          ]),
          Column(
            children: [
              Image.asset(HomeImages.wlogo),
              SizedBox(height: size.height * 0.055),
              AppText(
                  text: 'Join Now',
                  size: 16,
                  fontweight: FontWeight.w900,
                  color: Appcolors.yellow)
            ],
          )
        ],
      ),
    );
  }
}

class PlansAppbar extends StatelessWidget {
  var data;
   PlansAppbar({super.key,this.data});

  @override
  Widget build(BuildContext context) {
    final watchPlansCubit = context.watch<PlansCubit>();
    final readPlansCubit = context.read<PlansCubit>();
    final size = MediaQuery.sizeOf(context);
    return AppshadowContainer(
      padding: EdgeInsets.symmetric(
          vertical: size.width * 0.02, horizontal: size.width * 0.03),
      radius: 0,
      shadowcolour: Appcolors.redColor,
      color: Appcolors.redColor,
      child: Column(
        children: [
          Row(children: [
            GestureDetector(
              onTap:
                () => data.currentState?.openDrawer(),
              
              child: Image.asset(HomeImages.wlogo)),
            SizedBox(width: size.width * 0.025),
            AppText(
                size: 20,
                text: 'ClickTweak',
                fontweight: FontWeight.w900,
                color: Appcolors.white)
          ]),
          SizedBox(height: size.height * 0.03),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * 0.25,
                  child: PlansFilter(
                      ontap: () =>
                          readPlansCubit.selectPlansFilter(plan: 'PLANS'),
                      title: 'PLANS',
                      icon: ImageIcon(
                        const AssetImage('assets/Icons/plansImage.png'),
                        color: watchPlansCubit.planFilter == 'PLANS'
                            ? Appcolors.yellow
                            : const Color(0xFFC9C9C9),
                      ),
                      isActive: watchPlansCubit.planFilter == 'PLANS'),
                ),
                SizedBox(
                  width: size.width * 0.40,
                  child: PlansFilter(
                      isActive: watchPlansCubit.planFilter == 'YOUR PLANS',
                      ontap: () =>
                          readPlansCubit.selectPlansFilter(plan: 'YOUR PLANS'),
                      title: 'YOUR PLANS',
                      icon: ImageIcon(
                        const AssetImage('assets/Icons/plansImage.png'),
                        color: watchPlansCubit.planFilter == 'YOUR PLANS'
                            ? Appcolors.yellow
                            : const Color(0xFFC9C9C9),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PlansFilter extends StatelessWidget {
  const PlansFilter(
      {super.key,
      required this.title,
      required this.icon,
      this.isActive = false,
      this.ontap});
  final String title;
  final Widget icon;
  final bool isActive;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(
                width: 8,
              ),
              AppText(
                size: 16,
                fontweight: FontWeight.w900,
                text: title,
                color: isActive ? Appcolors.yellow : const Color(0xFFC9C9C9),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.004),
          Container(
            width: size.width,
            height: size.height * 0.005,
            decoration: BoxDecoration(
                color: isActive ? Appcolors.yellow : Appcolors.redColor),
          )
        ],
      ),
    );
  }
}

class AllPlans extends StatefulWidget {
  const AllPlans({super.key});

  @override
  State<AllPlans> createState() => _AllPlansState();
}

class _AllPlansState extends State<AllPlans> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
              10,
              (index) => GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.planDetail);
                    },
                    child: AppshadowContainer(
                      padding: EdgeInsets.symmetric(
                          vertical: size.width * 0.02,
                          horizontal: size.width * 0.02),
                      radius: size.width * 0.02,
                      margin: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.005),
                      shadowcolour: Appcolors.white,
                      color: Appcolors.redColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                    text: 'PLAN ${index + 1}',
                                    size: 16,
                                    fontweight: FontWeight.w900,
                                    color: Appcolors.white),
                                SizedBox(height: size.height * 0.003),
                                AppText(
                                    text: 'Price',
                                    size: 16,
                                    fontweight: FontWeight.w700,
                                    color: Appcolors.white),
                                SizedBox(height: size.height * 0.002),
                                AppText(
                                    text: '\$20',
                                    size: 16,
                                    fontweight: FontWeight.w700,
                                    color: Appcolors.white),
                                SizedBox(height: size.height * 0.002),
                                AppText(
                                    text: 'Earnings per video',
                                    size: 16,
                                    fontweight: FontWeight.w700,
                                    color: Appcolors.white),
                                SizedBox(height: size.height * 0.002),
                                AppText(
                                    text: '\$0.332/\$319',
                                    size: 16,
                                    fontweight: FontWeight.w700,
                                    color: Appcolors.white)
                              ]),
                          Column(
                            children: [
                              Image.asset(HomeImages.wlogo),
                              SizedBox(height: size.height * 0.055),
                              AppText(
                                  text: 'Join Now',
                                  size: 16,
                                  fontweight: FontWeight.w900,
                                  color: Appcolors.yellow)
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}
