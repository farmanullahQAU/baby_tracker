import 'dart:async';
import 'dart:isolate';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:baby_tracker/assets_path.dart';
import 'package:baby_tracker/constants/text_constants.dart';
import 'package:baby_tracker/models/brest_model.dart';
import 'package:baby_tracker/services/duration_formater.dart';
import 'package:baby_tracker/services/firestore_services.dart';
import 'package:baby_tracker/view/feeding/feeding_view.dart';
import 'package:baby_tracker/view/feeding/feeding_view_controller.dart';
import 'package:baby_tracker/view/signup/signup_view.dart';
import 'package:baby_tracker/view/timer/timer_view_controller.dart';
import 'package:baby_tracker/widgets/app_drawer.dart';
import 'package:baby_tracker/widgets/image_avatar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:get/get.dart';

import '../textstyles.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {

   HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subtitle1TextStyle=Theme.of(context).textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold,letterSpacing: 0.8);

final subtitle2TextStyle=Theme.of(Get.context!).textTheme.subtitle2?.copyWith(letterSpacing: 0.8);

    return Scaffold(
        drawer: AppDrawer(),
        key: controller.homeScaffoldKey,
        appBar: AppBar(
          title: Text("home"),
          leading: IconButton(
              onPressed: () {
                controller.controlHomeMenu();
              },
              icon: Image.asset(menuIcon)),
          elevation: 0.0,
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageAvatar(imagePath: logo),
                SizedBox(
                  height: 20,
                ),

//top row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: SizedBox(
                          width: Get.width * 0.5,
                          child: _addHomeCard(
                              brestIcon, "Feeding", "1 Hour 22 Minutes Ago",
                              onTap: () => Get.to(() => FeedingView(),
                                      binding: BindingsBuilder(() {
                                    Get.lazyPut(() => FeedingViewController());
                                  })))),
                    ),
                    Flexible(
                      child: SizedBox(
                          width: Get.width * 0.5,
                          child: _addHomeCard(
                              sleepingIcon, "Sleep", "1 Hour 4 Minutes Ago")),
                    )
                  ],
                ),

                SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: SizedBox(
                          width: double.infinity,
                          height: Get.width * 0.3,
                          child: _addHomeCard(
                              babyFeederIcon, "Bootle", "4 Minutes Ago",
                              imageWidth: 40)),
                    ),
                    Flexible(
                      child: SizedBox(
                          width: double.infinity,
                          height: Get.width * 0.3,
                          child: _addHomeCard(
                              breastPumIcon, "Pumping", "1 Hour Ago",
                              imageWidth: 40)),
                    ),
                    Flexible(
                      child: SizedBox(
                          width: double.infinity,
                          height: Get.width * 0.3,
                          child: _addHomeCard(
                              diaperIcon, "Diaper", "44 Minutes Ago",
                              imageWidth: 40, onTap: () async {
                            Get.to(() => SignupView());
                          })),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

//history text

                Text(
                  history.toUpperCase(),
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  height: 20,
                ),

                // _addHistoryCard()
                _getHistoryFromFirestore()
              ],
            ),
          ),
        ));
  }

  Widget _addHomeCard(String iconPath, String title, String subtitle,
      {double? imageWidth, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 0.2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  iconPath,
                  width: imageWidth,
                ),

                Text(
                  title,
                  style: Theme.of(Get.context!).textTheme.subtitle1),

                //this will be made dynamic
                FittedBox(
                    child: Text(
                  subtitle,
                  style: Theme.of(Get.context!).textTheme.subtitle2,
                ))
              ]),
        ),
      ),
    );
  }


  _getHistoryFromFirestore(){

    return Expanded(
      child: FirestoreListView<FeedModel>(

        
        query: FirestoreServices.history,
  loadingBuilder: (context) => Center(child: CircularProgressIndicator()),
  errorBuilder: (context, error, stackTrace) => Text(error.toString()), 
  
  
itemBuilder: (BuildContext, QueryDocumentSnapshot<FeedModel> snapshot) {
   

      return Card(
        
        elevation: 0.0,
        child: _builCardContents(snapshot.data()));

    // ...
  },

  
  // ...
    ));
  }



  Widget _builCardContents(FeedModel feedModel) {
  return SizedBox(

    child: ListTile(
        trailing:      Text(controller.getFormatedDate(feedModel.dateFinished),style: Theme.of(Get.context!).textTheme.bodyText1?.copyWith(fontStyle: FontStyle.italic)),


      subtitle: 
        controller.isBothFeeded(feedModel)?

      
      Row(

        children: [



          Text("Left: ${feedModel.leftBrFeedDuration}",style:Theme.of(Get.context!).textTheme.subtitle2,),
          SizedBox(width: 20,),
          Text("Right: ${feedModel.leftBrFeedDuration}",style: Theme.of(Get.context!).textTheme.subtitle2,),

        ],
      ):
      
      
       Row(

        children: [
Text(         "${ feedModel.checkPosition(feedModel.position).capitalizeFirst}: ${feedModel.leftBrFeedDuration??feedModel.rightBrFeedDuration}",style: Theme.of(Get.context!).textTheme.subtitle2,
),



        ],
      )
      
      ,
      leading: Padding(
        padding: const EdgeInsets.symmetric(
          vertical:
          8.0),
        child: Image.asset(brestIcon),
      ),
      
      title:
  
    Row(
      children: [
  
  
  
        Text(
          
        controller.isBothFeeded(feedModel)?
          
          "Both Brest":"Single",style: Theme.of(Get.context!).textTheme.subtitle1),
        SizedBox(width: Get.width*0.1,),

          Text(feedModel.totalFeedingDuration),
      ]

    )
    ),
  );
  
  //  Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Text(


  //                   "Both Brest \t",
  //                   style: TextStyles.titleStyle,
  //                 ),
  //                 Text(
  //                   "${controller.getFormatedDate(controller.lastBrestFeeded!)}",
  //                   style: TextStyles.subtitleStyle,
  //                 )
  //               ],
  //             ),
  //             SizedBox(
  //               height: 10,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Text(
  //                   "Left ${DurationServices.buildTime(controller.leftBreastDuration)}",
  //                   style: TextStyles.subtitleStyle,
  //                 ),
  //                 Text(
  //                   "Right ${DurationServices.buildTime(controller.rightBreastDuration)}",
  //                   style: TextStyles.subtitleStyle,
  //                 ),
  //               ],
  //             )
  //           ],
  //         );
      
  }
}
