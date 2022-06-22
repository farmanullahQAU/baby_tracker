


import 'dart:async';
import 'dart:isolate';

import 'package:baby_tracker/services/firestore_services.dart';
import 'package:baby_tracker/view/feeding/feeding_view.dart';
import 'package:baby_tracker/view/timer/timer_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/brest_model.dart';
import '../../services/duration_formater.dart';
import '../home_controller.dart';

class FeedingViewController extends GetxController   with GetTickerProviderStateMixin{


      final _leftBreastTimerDuration=Duration().obs;

     Duration get 
     leftBreastTimerDuration=>_leftBreastTimerDuration.value;
Duration get rightBreastTimerDuration=>_rightBreastTimerDuration.value;
     set leftBreastTimerDuration(Duration duration)=>_leftBreastTimerDuration.value=duration;
     set rightBreastTimerDuration(Duration duration)=>_rightBreastTimerDuration.value=duration;


    final  _rightBreastTimerDuration=Duration().obs;


    Rx<Duration>  rightBreastTimerDuration2=Duration().obs;
    Rx<Duration>  leftBreastTimerDuration2=Duration().obs;


    static Timer? 
        leftBreastTimer;
final isRunning=false.obs;


  static  Timer? rightBreastTimer;

/*
    void startLeftBreastTimer(int a) async{

      await Future.delayed(Duration(seconds: 10));

      leftBrSec.value=10000;

    int sec=1;
final timer=Timer.periodic(Duration(seconds: 1), (timer) {



 final seconds=leftBreastTimerDuration.inSeconds+sec;

 leftBreastTimerDuration=Duration(seconds: seconds);




 });


 


  }
*/

  Isolate? _isolate;

  ReceivePort? _receivePort;

  bool get isStarted => _isolate != null;

  void startIsolate() async {

    _receivePort = ReceivePort();
    _isolate = await Isolate.spawn(
      _checkTimer,
      _receivePort!.sendPort,
    );

isRunning.value=true;
    
    _receivePort?.listen(
      _handleMessage,
      onDone: () {
        //@TODO this never fires
        print('done!');
      },
    );
  }

  void stopIsolate() => _stop();




  static void _checkTimer(SendPort sendPort) async {
    int sec=1;
   
   leftBreastTimer=
    Timer.periodic(
      const Duration(seconds: 1),
      (t) async {


        

        sendPort.send(sec);
      },
    );
  }

  void _handleMessage(dynamic seconds) {

int sec=seconds;
if(



  isLeftClicked.isTrue
){

  //increment leftBr time
  
    final duration2=Duration(seconds: leftBreastTimerDuration2.value.inSeconds+sec);
    final duration=Duration(seconds: leftBreastTimerDuration.inSeconds+sec);


  leftBreastTimerDuration=duration;
  leftBreastTimerDuration2.value=duration2;

}
if(isRightClicked.isTrue){
  //increment rightBr timer each one second
final duration=Duration(seconds: rightBreastTimerDuration.inSeconds+sec);
    final duration2=Duration(seconds: rightBreastTimerDuration2.value.inSeconds+sec);


  rightBreastTimerDuration=duration;
  rightBreastTimerDuration2.value=duration2;



}
  
  }

  void _stop() {
    if (_isolate != null) {


      _receivePort?.close();
      _isolate?.kill(priority: Isolate.immediate);
      _isolate = null;
//to show in history card in home, set for homecontroller
 Get.find<HomeController>().isBrestFeeded=true;
 //when user backs save current time
      Get.find<HomeController>().lastBrestFeeded=DateTime.now();

      Get.find<HomeController>().leftBreastDuration=leftBreastTimerDuration;
      Get.find<HomeController>().rightBreastDuration=rightBreastTimerDuration;

      //to show pause and play button on BrestWidgets
isRunning.value=false;

    }


  }

// resetDurations(){
  

// leftBreastTimerDuration2.value=Duration();
// rightBreastTimerDuration2.value=Duration();

// }

  AnimationController get animationController=>_controller;
 late final AnimationController _controller = AnimationController(
    value: 0.1,
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> animation = CurvedAnimation(
    parent: _controller,
     curve: Curves.fastOutSlowIn,
  );
  
final RxBool isLeftClicked=false.obs;
final RxBool isRightClicked=false.obs;



   final List<FeedModel> leftBrFeedingDurationList=<FeedModel>[].obs;
   final List<FeedModel> rightBrFeedingDurationList=<FeedModel>[].obs;


@override
  void onInit() {
    initAnimationController();


    super.onInit();
  }



   void initAnimationController() {
    _controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _controller.dispose();
      } else if (status == AnimationStatus.dismissed) {
        _controller.dispose();
      }
    });
    _controller.forward();
  }


toggleRight(){


    isRightClicked.toggle();

    //when change breast then stop current isolate 
    
   isLeftClicked.isTrue?isLeftClicked.value=false:null;
    finishFeeding();


}

toggleLeft()  {


    isLeftClicked.toggle();


  isRightClicked.isTrue?isRightClicked.value=false:null;
    finishFeeding();


}
finishFeeding() async {
stopIsolate();
FeedModel feedModel;


  if(isLeftClicked.isTrue)
  {


    DateTime dateFinishded=DateTime.now();
    //if left is running and user has clicked to finish button
   feedModel=new FeedModel(
     dateFinished: DateTime.now(),
     totalFeedingDuration:DurationServices.buildTime(getTotalFeedingTime)!,
     
     
     
     position:BrPosition.right,leftBrFeedDuration:


  
  DurationServices.buildTime(leftBreastTimerDuration),

  rightBrFeedDuration: DurationServices.buildTime(rightBreastTimerDuration)



);
rightBrFeedingDurationList.add(feedModel);
  rightBreastTimerDuration2=Duration().obs;


    
  }


  if(isRightClicked.isTrue)
  {

    //if right is feeding and user has clicked the finish button
  feedModel=new FeedModel(
    
    dateFinished: DateTime.now(),
    position:BrPosition.left,

  totalFeedingDuration: DurationServices.buildTime(getTotalFeedingTime)!,
  

  rightBrFeedDuration:
  DurationServices.buildTime(rightBreastTimerDuration),

  leftBrFeedDuration: DurationServices.buildTime(leftBreastTimerDuration



));
leftBrFeedingDurationList.add(feedModel);
  leftBreastTimerDuration2=Duration().obs;


    
  }
//close leftBrest and RightBrest icons
  // isLeftClicked.value=false;
  // isRightClicked.value=false;
//add details to firestore
  // await FirestoreServices().addHistory(feedModel);
  //rest to start from 0 sec when user again click on any brest widget
  //  resetDurations();











}

 Duration get getTotalFeedingTime=>leftBreastTimerDuration+rightBreastTimerDuration;


bool get areBothClosed=>isLeftClicked.isFalse&&isRightClicked.isFalse;

}

/*
import 'dart:async';
import 'dart:isolate';

import 'package:baby_tracker/services/firestore_services.dart';
import 'package:baby_tracker/view/feeding/feeding_view.dart';
import 'package:baby_tracker/view/timer/timer_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/brest_model.dart';
import '../../services/duration_formater.dart';
import '../home_controller.dart';

class FeedingViewController extends GetxController   with GetTickerProviderStateMixin{


      final _leftBreastTimerDuration=Duration().obs;

     Duration get 
     leftBreastTimerDuration=>_leftBreastTimerDuration.value;
Duration get rightBreastTimerDuration=>_rightBreastTimerDuration.value;
     set leftBreastTimerDuration(Duration duration)=>_leftBreastTimerDuration.value=duration;
     set rightBreastTimerDuration(Duration duration)=>_rightBreastTimerDuration.value=duration;


    final  _rightBreastTimerDuration=Duration().obs;
    static Timer? 
        leftBreastTimer;
final isRunning=false.obs;


  static  Timer? rightBreastTimer;

/*
    void startLeftBreastTimer(int a) async{

      await Future.delayed(Duration(seconds: 10));

      leftBrSec.value=10000;

    int sec=1;
final timer=Timer.periodic(Duration(seconds: 1), (timer) {



 final seconds=leftBreastTimerDuration.inSeconds+sec;

 leftBreastTimerDuration=Duration(seconds: seconds);




 });


 


  }
*/

  Isolate? _isolate;

  ReceivePort? _receivePort;

  bool get isStarted => _isolate != null;

  void startIsolate() async {

    _receivePort = ReceivePort();
    _isolate = await Isolate.spawn(
      _checkTimer,
      _receivePort!.sendPort,
    );

isRunning.value=true;
    
    _receivePort?.listen(
      _handleMessage,
      onDone: () {
        //@TODO this never fires
        print('done!');
      },
    );
  }

  void stopIsolate() => _stop();




  static void _checkTimer(SendPort sendPort) async {
    int sec=1;
   
   leftBreastTimer=
    Timer.periodic(
      const Duration(seconds: 1),
      (t) async {


        

        sendPort.send(sec);
      },
    );
  }

  void _handleMessage(dynamic seconds) {

int sec=seconds;
if(



  Get.find<FeedingViewController>().isLeftClicked.isTrue
){

  //increment leftBr time
    final duration=Duration(seconds: leftBreastTimerDuration.inSeconds+sec);

  leftBreastTimerDuration=duration;

}
else{
  //increment rightBr timer each one second
final duration=Duration(seconds: rightBreastTimerDuration.inSeconds+sec);

  rightBreastTimerDuration=duration;

}
  
  }

  void _stop() {
    if (_isolate != null) {

   
      _receivePort?.close();
      _isolate?.kill(priority: Isolate.immediate);
      _isolate = null;
//to show in history card in home, set for homecontroller
 Get.find<HomeController>().isBrestFeeded=true;
 //when user backs save current time
      Get.find<HomeController>().lastBrestFeeded=DateTime.now();

      Get.find<HomeController>().leftBreastDuration=leftBreastTimerDuration;
      Get.find<HomeController>().rightBreastDuration=rightBreastTimerDuration;

      //to show pause and play button on BrestWidgets
isRunning.value=false;

    }
  }

resetDurations(){

_leftBreastTimerDuration.value=Duration();
_rightBreastTimerDuration.value=Duration();

}

  AnimationController get animationController=>_controller;
 late final AnimationController _controller = AnimationController(
    value: 0.1,
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> animation = CurvedAnimation(
    parent: _controller,
     curve: Curves.fastOutSlowIn,
  );
  
final RxBool isLeftClicked=false.obs;
final RxBool isRightClicked=false.obs;



   final List<Duration> leftBrFeedingDurationList=<Duration>[].obs;
   final List<Duration> rightBrFeedingDurationList=<Duration>[].obs;


@override
  void onInit() {
    initAnimationController();


    super.onInit();
  }



   void initAnimationController() {
    _controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _controller.dispose();
      } else if (status == AnimationStatus.dismissed) {
        _controller.dispose();
      }
    });
    _controller.forward();
  }


toggleRight(){


    isRightClicked.toggle();

    //when change breast then stop current isolate 
    //if left has also open close this
  isLeftClicked.isTrue?isLeftClicked.value=false:null;
  finishFeeding();

}

toggleLeft()  {


    isLeftClicked.toggle();


  isRightClicked.isTrue?isRightClicked.value=false:null;
  finishFeeding();



}
finishFeeding() async {
stopIsolate();
late FeedModel feedModel;


  if(isRightClicked.isTrue)
  {
    DateTime dateFinishded=DateTime.now();
    //if left is running and user has clicked to finish button
   feedModel=new FeedModel(
     dateFinished: DateTime.now(),
     totalFeedingDuration:DurationServices.buildTime(calculateTotalDuration())??"",
     
     
     
     position:BrPosition.left,leftBrFeedDuration:


  
  DurationServices.buildTime(leftBreastTimerDuration),

  rightBrFeedDuration: DurationServices.buildTime(rightBreastTimerDuration)



);
leftBrFeedingDurationList.add(leftBreastTimerDuration);
leftBreastTimerDuration=Duration();


    
  }


  if(isLeftClicked.isTrue)
  {
  feedModel= FeedModel(
    
    dateFinished: DateTime.now(),
    position:BrPosition.right,

  totalFeedingDuration: DurationServices.buildTime(calculateTotalDuration())??"",
  

  rightBrFeedDuration:
  DurationServices.buildTime(rightBreastTimerDuration),

  leftBrFeedDuration: DurationServices.buildTime(leftBreastTimerDuration



));
rightBrFeedingDurationList.add(rightBreastTimerDuration);
rightBreastTimerDuration=Duration();
    
  }
// //close leftBrest and RightBrest icons
//   isLeftClicked.value=false;
//   isRightClicked.value=false;
//add details to firestore
  // await FirestoreServices().addHistory(feedModel);
  //rest to start from 0 sec when user again click on any brest widget











}

//  Duration get getTotalFeedingTime=>leftBreastTimerDuration+rightBreastTimerDuration;


bool get areBothClosed=>isLeftClicked.isFalse&&isRightClicked.isFalse;

  Duration calculateTotalDuration() {



    Duration totalDuration=Duration();

    for(var leftDur in leftBrFeedingDurationList)
    {
      for(var rightDur in rightBrFeedingDurationList)
      {
totalDuration=


rightDur+leftDur;

      }
    }

    print("ttttttttttttttttttttttttt");
    print(totalDuration);
    return totalDuration;
  }



}

*/