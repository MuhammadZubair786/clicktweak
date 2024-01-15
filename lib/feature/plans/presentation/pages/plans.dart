// ignore_for_file: prefer_const_constructors

import 'package:clicktwaek/config/page%20route/detail/route_name.dart';
import 'package:clicktwaek/constants/export.dart';
import 'package:clicktwaek/feature/plans/presentation/bloc/cubit/plans_cubit.dart';
import 'package:clicktwaek/feature/plans/presentation/pages/plans_details.dart';
import 'package:clicktwaek/feature/splash_onboarding/presentation/bloc/cubit/onboarding_cubit.dart';
import 'package:flutter/foundation.dart';
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

    return DefaultTabController(
      length: 2, // Number of tabs
      child: AppScaffold(
        backGroundColor: Color.fromARGB(255, 239, 240, 239),
        color: Appcolors.redColor,
        // drawer: const NavDrawer(),
        body: Column(
          children: [
            // PlansAppbar(data: scaffolKey),
            // SizedBox(height: size.height * 0.02),

            // TabBar
            Container(
              color: Colors.red,
              child: TabBar(
              
              indicatorColor: Appcolors.yellow,
                labelColor: Appcolors.orange,
                unselectedLabelColor: const Color(0xFFC9C9C9),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight:5,
                tabs: [
                  Tab(child: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: SizedBox(
                      // width: size.width * 0.25,
                      child: PlansFilter(
                      
                        title: 'PLANS',
                        icon: ImageIcon(
                          const AssetImage('assets/Icons/plansImage.png'),
                          color:Appcolors.yellow
                             
                        ),
                        // isActive: watchPlansCubit.planFilter == 'PLANS',
                      ),
                    ),
                  ),),
                  Tab(child: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: PlansFilter(
                    
                      title: 'Your PLANS',
                      icon: ImageIcon(
                        const AssetImage('assets/Icons/plansImage.png'),
                        color:Appcolors.yellow
                           
                      ),
                      // isActive: watchPlansCubit.planFilter == 'PLANS',
                    ),
                  ),),
                  // Tab(text: 'YOUR PLANS'),
                ],
              ),
            ),

            // TabBarView
            Expanded(
              child: TabBarView(
                children: [
                  AllPlans(),
                  YourPlans(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class YourPlans extends StatefulWidget {
  const YourPlans({super.key});

  @override
  State<YourPlans> createState() => _YourPlansState();
}

class _YourPlansState extends State<YourPlans> {
  @override
  void initState() {
    super.initState();
    getCurrentPackage();
  }

  var userPlan;

  getCurrentPackage() async {
    var res = await OnboardingCubit().getUserPlansData();

    setState(() {
      userPlan = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return 
    userPlan==null ?
   
      Container(
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
     color: Colors.white,
     borderRadius: BorderRadius.circular(10.0),
     boxShadow: [
       BoxShadow(
         color: Colors.grey.withOpacity(0.5),
         spreadRadius: 2,
         blurRadius: 5,
         offset: Offset(0, 3),
       ),
     ],
      ),
      child: Center(
     child: CircularProgressIndicator(
       valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
       strokeWidth: 8.0,
     ),
      ),
    ):
    userPlan != null
        ? Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(border: Border.all(width: 2,color: Colors.white),
              borderRadius: BorderRadius.circular(10),
               color: Colors.black,
              ),

             
              height: MediaQuery.of(context).size.height*0.18,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      AppText(
                          text: '${userPlan["title"].toString()}',
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
                      AppText(
                          text: '\$ ${userPlan["price"].toString()}',
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
                      AppText(
                          text: '\$ ${userPlan["earn_per_video"].toString()}',
                          size: 16,
                          fontweight: FontWeight.w700,
                          color: Color(0xFFB9B9B9))
                    ]),
                    // Column(
                    //   children: [
                    //     Image.asset(HomeImages.wlogo),
                    //     SizedBox(height: size.height * 0.055),
                    //     AppText(
                    //         text: 'Join Now',
                    //         size: 16,
                    //         fontweight: FontWeight.w900,
                    //         color: Appcolors.yellow)
                    //   ],
                    // )
                  ],
                ),
            ),
          ],
        )
        : Container();
  }
}

class PlansAppbar extends StatelessWidget {
  var data;
  PlansAppbar({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final watchPlansCubit = context.watch<PlansCubit>();
    final readPlansCubit = context.read<PlansCubit>();
    final size = MediaQuery.sizeOf(context);
    return AppshadowContainer(
      padding: EdgeInsets.symmetric(
          vertical: size.width * 0.02, horizontal: size.width * 0.03),
      radius: 0,
      shadowcolour: Appcolors.blue,
      color: Appcolors.blue,
      child: Column(
        children: [
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
                          ? Appcolors.redColor
                          : const Color(0xFFC9C9C9),
                    ),
                    isActive: watchPlansCubit.planFilter == 'PLANS',
                  ),
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
                      color: Colors.greenAccent
                    ),
                  ),
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
    return Container(
      width: MediaQuery.of(context).size.width*0.5,
      child: GestureDetector(
        onTap: ontap,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(
                  width: 16,
                ),
                AppText(
                  size: 18,
                  fontweight: FontWeight.w900,
                  text: title,
                  color:Appcolors.yellow
                ),
              ],
            ),
            SizedBox(height: size.height * 0.004),
            // Container(
            //   width: size.width,
            //   height: size.height * 0.005,
            //   decoration: BoxDecoration(
            //       color: isActive ? Appcolors.yellow : Appcolors.redColor),
            // )
          ],
        ),
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
  var plansList = [];

  @override
  void initState() {
    super.initState();
    getAllPlans();
  }

  getAllPlans() async {
    var data = await OnboardingCubit().getPlansData();
    print(data);
    if (data.length > 0) {
      plansList = data;
      setState(() {});
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return plansList.length==0?
      Container(
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
     color: Colors.white,
     borderRadius: BorderRadius.circular(10.0),
     boxShadow: [
       BoxShadow(
         color: Colors.grey.withOpacity(0.5),
         spreadRadius: 2,
         blurRadius: 5,
         offset: Offset(0, 3),
       ),
     ],
      ),
      child: Center(
     child: CircularProgressIndicator(
       valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
       strokeWidth: 8.0,
     ),
      ),
    ):

      SingleChildScrollView(
         child: Column(
       children: List.generate(
         plansList.length,
         (index) => GestureDetector(
           onTap: () {
             Navigator.push(
               context,
               MaterialPageRoute(
                 builder: (context) => PlansDetails(
                   data: plansList[index],
                 ),
               ),
             );
           },
           child: 
           AppshadowContainer(
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
                         text: '\$ ${plansList[index]["price"]}',
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
                         text:
                             '\$ ${plansList[index]["earn_per_video"]}/\$${plansList[index]["total_earn_user"]}',
                         size: 16,
                         fontweight: FontWeight.w700,
                         color: Appcolors.white)
                   ],
                 ),
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
      );
  }
}
