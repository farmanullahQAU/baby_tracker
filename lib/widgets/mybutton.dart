import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
    Function()? onTap;
    Color? primary;
    BorderSide? side;
    double? borderRadius;

    

    String buttonText;
Widget? icon;
 MyButton({
   this.side,
   this.borderRadius,
   Key? key, required this.buttonText,  this.onTap,this.icon,this.primary}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      
    
      
      icon:icon??Container(width: 0.0,height: 0.0,) ,
      
        label: Text(buttonText),
        style:
            ElevatedButton.styleFrom(
            

shape:   RoundedRectangleBorder(

side: side??BorderSide.none,
  borderRadius: BorderRadius.circular(borderRadius??50)
),


              
              primary:primary??Theme.of(context).primaryColor),
        onPressed: onTap);
  }
}
