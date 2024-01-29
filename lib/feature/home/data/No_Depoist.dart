// ignore_for_file: prefer_const_constructors

import 'package:clicktwaek/feature/home/presentration/src/widgets/navigationDrawer.dart';
import 'package:flutter/material.dart';

class NoDepoist extends StatefulWidget {
  const NoDepoist({super.key});

  @override
  State<NoDepoist> createState() => _NoDepoistState();
}

class _NoDepoistState extends State<NoDepoist> {
  @override


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
    return SafeArea(
      
      child: Scaffold(
        appBar: AppBar(
           backgroundColor: Colors.red,
           leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);            },
              
            child: Icon(Icons.arrow_back,color: Colors.white,)),
           
           title: Text("Depoist"),
        ),
        drawer: NavDrawer(),
       body: Column(
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
                  // Image.asset("assets/home/empty.png",fit: BoxFit.cover,),
                  SizedBox(height: 20,),
                Transform.scale(
              scale: _scale,child: Text("Can't deposit now",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),))
                ],
              ),
            ),
          ],
        ),
      ),
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