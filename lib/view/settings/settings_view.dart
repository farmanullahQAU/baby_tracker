import 'package:baby_tracker/textstyles.dart';
import 'package:baby_tracker/view/settings/settings_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SettingsView extends StatelessWidget {
  final _settingsController =Get.find<SettingsController>();
   SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings"),),
      
      body: Container(


      child: Column(children: [

 ListTile(
   title: Obx(()=>_settingsController.isDark? Text("Light",style: Theme.of(context).textTheme.subtitle1,):Text("Dark",style: Theme.of(context).textTheme.subtitle1,)),
   trailing: Obx(
 
                   () => 
                  CupertinoSwitch(
                    activeColor: Theme.of(context).backgroundColor,
                    trackColor: Colors.cyan,
                               value: _settingsController.isDark,
                               onChanged: (val)=>_settingsController.changeTheme()
                             ),
                 ),
 ),
//  IconButton(

//    onPressed: (){

//     Get.changeTheme(AppTheme.orangeTheme);

//    },
//    icon: Text("kkkkk")
//  ),
      ],),
    ));
  }
}