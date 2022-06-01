


import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:baby_tracker/view/home_view.dart';
import 'package:baby_tracker/view/signup/signup_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

import 'package:get/get.dart';

import 'app_theme.dart';
import 'binder.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    // await AndroidAlarmManager.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp( MyApp());

}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      home:
      
      
      HomeView(),
   themeMode: ThemeMode.system,

    //  darkTheme: ThemeData.dark(),
//we need some custom changes in default dark theme so we use AppTheme.darkTheme
    darkTheme: AppTheme().darkTheme,
     theme: AppTheme().primaryTheme,

        title:"BABY TRACKER",
        initialBinding: Binder(),


      
        
        
        
        
        );
  }
}
