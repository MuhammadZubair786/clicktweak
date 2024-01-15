// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:clicktwaek/constants/export.dart';
import 'package:clicktwaek/feature/withdraw/presentation/bloc/cubit/withdraw_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../home/data/home_images.dart';

class Withdraw extends StatelessWidget {
  const Withdraw({super.key});

  @override
  Widget build(BuildContext context) {
    final withdrawFilter = context.watch<WithdrawCubit>().withdrawFilter;
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        backGroundColor: Appcolors.white,
        color: Appcolors.redColor,
        body: Column(
          children: [
            const WithdrawAppbar(),
            // SizedBox(height: size.height * 0.05),
            withdrawFilter == 'Withdraw'
                ? Column(
                    children: [
                      // SizedBox(height: size.height * 0.015),
                      const WithrawBalance(),
                    ],
                  )
                : const AllTransactions()

            //
            //
            // WithdrawEmpty()
          ],
        ));
  }
}

class WithdrawEmpty extends StatelessWidget {
  const WithdrawEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        SizedBox(height: size.height * 0.15),
        Image.asset(HomeImages.empty),
        SizedBox(height: size.height * 0.015),
        const AppText(
            text: 'Looks like there is nothing to\nshow ',
            size: 20,
            textalign: TextAlign.center)
      ],
    );
  }
}

class AllTransactions extends StatefulWidget {
  const AllTransactions({super.key});

  @override
  State<AllTransactions> createState() => _AllTransactionsState();
}

class _AllTransactionsState extends State<AllTransactions> {
   double _scale = 0.0;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeOpacity();
  }


   void changeOpacity() {
    setState((){
       _scale =_scale+ 0.05;
     
    } );
    print(_scale);
    if(_scale < 1){
       Future.delayed(Duration(milliseconds: 40), () {
      changeOpacity();
    });
    }else{
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // SizedBox(height: 150,),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             SizedBox(height: 40,),
              Image.asset("assets/home/empty.png",fit: BoxFit.cover,),
              SizedBox(height: 20,),
            Transform.scale(
                         scale: _scale,child: Text("No Transaction",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),))
            ],
          ),
        ),
      ],
    );
    
    //  Expanded(
    //     child: SingleChildScrollView(
    //   child: Column(
    //     children: List.generate(
    //         5,
    //         (index) => Padding(
    //               padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
    //               child: Column(
    //                 children: [
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       Image.asset(HomeImages.wlogo,
    //                           color: index.isOdd
    //                               ? Appcolors.green
    //                               : Appcolors.redColor),
    //                       SizedBox(
    //                           width: size.width * 0.6,
    //                           child: AppText(
    //                               text: index.isOdd ? 'Deposit' : 'Withdraw',
    //                               fontweight: FontWeight.w600,
    //                               size: 25)),
    //                       AppText(
    //                           text: '\$100',
    //                           size: 24,
    //                           fontweight: FontWeight.w900,
    //                           color: Appcolors.blue)
    //                     ],
    //                   ),
    //                   SizedBox(height: size.height * 0.015),
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       AppText(
    //                           size: 13,
    //                           text: 'Pending ',
    //                           fontweight: FontWeight.w600,
    //                           color: Appcolors.redColor),
    //                       const AppText(
    //                           size: 13,
    //                           text: '20/01/2024/1:20 AM',
    //                           fontweight: FontWeight.w600)
    //                     ],
    //                   ),
    //                   Divider(color: Appcolors.blackColor),
    //                   SizedBox(height: size.height * 0.015),
    //                 ],
    //               ),
    //             )),
    //   ),
    // ));
  }
}

class WithrawBalance extends StatefulWidget {
  const WithrawBalance({super.key});

  @override
  State<WithrawBalance> createState() => _WithrawBalanceState();
}

class _WithrawBalanceState extends State<WithrawBalance> {


@override
  void initState() {
    // TODO: implement initState
    super.initState();
  getBalance();
  }
  var balance ="0";

  getBalance() async {

     var _preferences = await SharedPreferences.getInstance();
    balance =  _preferences.getString("Balance")!;
    setState(() {
      
    });
     

  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppshadowContainer(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
      // margin: EdgeInsets.symmetric(horizontal: size.width * 0.01),
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top:10),
        
           decoration: BoxDecoration(
            
            boxShadow: [  BoxShadow(
                  color: Color.fromARGB(255, 241, 241, 240).withOpacity(0.5),
                  spreadRadius: 10,
                  blurRadius: 10,
                  offset: Offset(0, 10),
                ),],
               color: const Color.fromARGB(255, 194, 22, 10),
               border: Border.all(color: Colors.yellow,width: 1),
               borderRadius: BorderRadius.circular(10)
           ),
        child: Column(
          children: [
            // SizedBox(height: size.height * 0.01),
            Row(
              children: [
                Image.asset(HomeImages.wlogo, color: Appcolors.white),
                SizedBox(width: size.width * 0.02),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(text: '\$ ${balance.toString()}', size: 32, fontweight: FontWeight.w800,color: Colors.white,),
                    AppText(
                        text: ' Total Balance',
                        size: 20,
                      color: Colors.white,
                        fontweight: FontWeight.w500)
                  ],
                )
              ],
            ),
            SizedBox(height: size.height * 0.05),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.06,),
                child: AppButton(
                  buttoncolor: Colors.amber,
                    child: AppText(
                    
                        text: 'Withdraw ',
                        size: 16,
                        color: Colors.white,
                        fontweight: FontWeight.w500,
                        ))),
            SizedBox(height: size.height * 0.05),
          ],
        ),
      ),
    );
  }
}

class WithdrawAppbar extends StatelessWidget {
  const WithdrawAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final withdrawFilter = context.watch<WithdrawCubit>().withdrawFilter;
    final readWithdrawCubit = context.read<WithdrawCubit>();
    return AppshadowContainer(
      padding: EdgeInsets.symmetric(
          vertical: size.width * 0.02, horizontal: size.width * 0.03),
      radius: 0,
      shadowcolour: Appcolors.white,
      color: Appcolors.redColor,
      child: Column(
        children: [
          // Row(children: [
          //   Image.asset(HomeImages.wlogo),
          //   SizedBox(width: size.width * 0.025),
          //   AppText(
          //       size: 20,
          //       text: 'ClickTweak',
          //       fontweight: FontWeight.w900,
          //       color: Appcolors.white)
          // ]),
          SizedBox(height: size.height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: size.width * 0.35,
                  child: WithdrawFilter(
                      icon: Icons.refresh,
                      title: 'Withdraw',
                      isActive: withdrawFilter == 'Withdraw',
                      onTap: () => readWithdrawCubit.selectWithdrawfilter(
                          filter: 'Withdraw'))),
              SizedBox(
                  width: size.width * 0.45,
                  child: WithdrawFilter(
                      icon: Icons.refresh,
                      title: 'TRANSACTIONS',
                      isActive: withdrawFilter == 'Transac',
                      onTap: () => readWithdrawCubit.selectWithdrawfilter(
                          filter: 'Transac'))),
            ],
          ),
        ],
      ),
    );
  }
}

class WithdrawFilter extends StatelessWidget {
  const WithdrawFilter(
      {super.key,
      required this.title,
      required this.icon,
      this.isActive = false,
      this.onTap});
  final String title;
  final IconData icon;
  final bool isActive;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(icon,
                  size: 25.sp,
                  color: isActive ? Appcolors.yellow : const Color(0xFFC9C9C9)),
              AppText(
                  size: 15,
                  fontweight: FontWeight.w900,
                  text: title,
                  color: isActive ? Appcolors.yellow : const Color(0xFFC9C9C9)),
            ],
          ),
          SizedBox(height: size.height * 0.004),
          Container(
              width: size.width * 0.4,
              height: size.height * 0.005,
              decoration: BoxDecoration(
                  color: isActive ? Appcolors.yellow : Appcolors.redColor))
        ],
      ),
    );
  }
}
