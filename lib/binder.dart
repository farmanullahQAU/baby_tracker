
import 'package:baby_tracker/view/feeding/feeding_view_controller.dart';
import 'package:baby_tracker/view/settings/settings_controller.dart';
import 'package:baby_tracker/view/timer/timer_view_controller.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

import 'view/home_controller.dart';

class Binder extends Bindings {

  @override
  void dependencies() {
     Get.put(SettingsController());


     Get.lazyPut(  ()=>HomeController());

     Get.lazyPut(  ()=>FeedingViewController());








  }
}
