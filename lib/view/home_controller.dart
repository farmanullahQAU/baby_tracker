import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:baby_tracker/models/brest_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
 DateTime? lastBrestFeeded;
  //getters

  //to show history card in home view
 RxBool _isBrestFeeded=false.obs;

//  bool get isBrestFeeded=>_isBrestFeeded.value;
 set isBrestFeeded(bool value)=>_isBrestFeeded.value=value;




  final _leftBreastDuration = Duration().obs;
 Duration get leftBreastDuration => _leftBreastDuration.value;
  final _rightBreastDuration = Duration().obs;
 Duration get rightBreastDuration => _rightBreastDuration.value;

  //setters
  set rightBreastDuration(Duration duration)=>_rightBreastDuration.value=duration;
  set leftBreastDuration(Duration duration)=>_leftBreastDuration.value=duration;



  late final GlobalKey<ScaffoldState> _homeScaffoldKey;
  @override
  Future<void> onInit() async {
    _homeScaffoldKey = GlobalKey<ScaffoldState>();

    super.onInit();
  }

  GlobalKey<ScaffoldState> get homeScaffoldKey => _homeScaffoldKey;

  void controlHomeMenu() {
    if (!homeScaffoldKey.currentState!.isDrawerOpen) {
      homeScaffoldKey.currentState!.openDrawer();
    }
  }

   bool  isBothFeeded(FeedModel model)=>model.leftBrFeedDuration!=null&&model.rightBrFeedDuration!=null;


  String getFormatedDate(DateTime dateTime){

    return DateFormat().add_MMMd().add_Hm().format(dateTime);
  }
}
