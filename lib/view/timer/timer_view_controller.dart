// import 'dart:async';
// import 'dart:isolate';

// import 'package:baby_tracker/view/feeding/feeding_view_controller.dart';
// import 'package:baby_tracker/view/home_controller.dart';
// import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
// import 'package:get/get_navigation/src/routes/default_transitions.dart';
// import 'package:get/state_manager.dart';

// import '../../models/isolate_model.dart';

// class TimerViewController extends GetxController{

//       final _leftBreastTimerDuration=Duration().obs;

//      Duration get 
//      leftBreastTimerDuration=>_leftBreastTimerDuration.value;
// Duration get rightBreastTimerDuration=>_rightBreastTimerDuration.value;
//      set leftBreastTimerDuration(Duration duration)=>_leftBreastTimerDuration.value=duration;
//      set rightBreastTimerDuration(Duration duration)=>_rightBreastTimerDuration.value=duration;


//     final  _rightBreastTimerDuration=Duration().obs;
//     static Timer? 
//         leftBreastTimer;
// final isRunning=false.obs;


//   static  Timer? rightBreastTimer;
// @override
//   void onInit() {


    
//     super.onInit();
//   }
// /*
//     void startLeftBreastTimer(int a) async{

//       await Future.delayed(Duration(seconds: 10));

//       leftBrSec.value=10000;

//     int sec=1;
// final timer=Timer.periodic(Duration(seconds: 1), (timer) {



//  final seconds=leftBreastTimerDuration.inSeconds+sec;

//  leftBreastTimerDuration=Duration(seconds: seconds);




//  });


 


//   }
// */

//   Isolate? _isolate;

//   ReceivePort? _receivePort;

//   bool get isStarted => _isolate != null;

//   void startIsolate() async {

//     _receivePort = ReceivePort();
//     _isolate = await Isolate.spawn(
//       _checkTimer,
//       _receivePort!.sendPort,
//     );

// isRunning.value=true;
    
//     _receivePort?.listen(
//       _handleMessage,
//       onDone: () {
//         //@TODO this never fires
//         print('done!');
//       },
//     );
//   }

//   void stopIsolate() => _stop();




//   static void _checkTimer(SendPort sendPort) async {
//     int sec=1;
   
//    leftBreastTimer=
//     Timer.periodic(
//       const Duration(seconds: 1),
//       (t) async {


        

//         sendPort.send(sec);
//       },
//     );
//   }

//   void _handleMessage(dynamic seconds) {

// int sec=seconds;
// if(



//   Get.find<FeedingViewController>().isLeftClicked.isTrue
// ){

//   //increment leftBr time
//     final duration=Duration(seconds: leftBreastTimerDuration.inSeconds+sec);

//   leftBreastTimerDuration=duration;

// }
// else{
//   //increment rightBr timer each one second
// final duration=Duration(seconds: rightBreastTimerDuration.inSeconds+sec);

//   rightBreastTimerDuration=duration;

// }
  
//   }

//   void _stop() {
//     if (_isolate != null) {

   
//       _receivePort?.close();
//       _isolate?.kill(priority: Isolate.immediate);
//       _isolate = null;
// //to show in history card in home, set for homecontroller
//  Get.find<HomeController>().isBrestFeeded=true;
//  //when user backs save current time
//       Get.find<HomeController>().lastBrestFeeded=DateTime.now();

//       Get.find<HomeController>().leftBreastDuration=leftBreastTimerDuration;
//       Get.find<HomeController>().rightBreastDuration=rightBreastTimerDuration;

//       //to show pause and play button on BrestWidgets
// isRunning.value=false;

//     }
//   }

// resetDurations(){

// _leftBreastTimerDuration.value=Duration();
// _rightBreastTimerDuration.value=Duration();

// }


// }