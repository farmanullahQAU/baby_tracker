
import 'package:baby_tracker/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {



 ThemeData darkTheme=ThemeData.dark().copyWith(

   textTheme: GoogleFonts.robotoFlexTextTheme(
  

  const TextTheme(
  
    subtitle1: TextStyle(fontWeight: FontWeight.bold,letterSpacing: 0.8),
    subtitle2: TextStyle(letterSpacing: 0.8),


 
    
    )
),
outlinedButtonTheme: 


OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          primary: Colors.white,
backgroundColor: Colors.cyan,
      padding: const EdgeInsets.symmetric(vertical: 25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
    )),


  inputDecorationTheme:  InputDecorationTheme(

    border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
      
      errorStyle: TextStyle(color: Colors.grey)),



);
   ThemeData primaryTheme = ThemeData(

    floatingActionButtonTheme:FloatingActionButtonThemeData(backgroundColor:backgroundColorPrimarySolid),
textButtonTheme: TextButtonThemeData(style: 


TextButton.styleFrom(

  //to give custom style to register button in flutter_fire ui SigninScreen
  primary: backgroundColorPrimarySolid,
      textStyle: const TextStyle(color: Colors.white),

    )

),

    backgroundColor: backgroundColorPrimary,
    

    inputDecorationTheme:  InputDecorationTheme(

      // enabledBorder: OutlineInputBorder(),

    border: OutlineInputBorder(
      
      
      borderRadius: BorderRadius.circular(50)),
      
      errorStyle: TextStyle(color: Colors.grey),
      
      prefixIconColor:Colors.grey),
textTheme: GoogleFonts.robotoFlexTextTheme(
  

  const TextTheme(

    subtitle2: TextStyle(letterSpacing: 0.8,color: Colors.grey),
  
    subtitle1: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold,letterSpacing: 0.8),

    headline3: const TextStyle(color: Colors.white),
    headline5: const TextStyle(color: Colors.black54))
),

    iconTheme: const IconThemeData(color: Colors.black54),

    
   
    primaryColor: backgroundColorPrimarySolid,
  
 
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          primary: Colors.black,
backgroundColor: backgroundColorPrimarySolid,
      textStyle: const TextStyle(color: Colors.white),
      padding: const EdgeInsets.symmetric(vertical: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
    )),
  );




}
