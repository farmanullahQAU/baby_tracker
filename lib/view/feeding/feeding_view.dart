
import 'package:baby_tracker/assets_path.dart';
import 'package:baby_tracker/models/brest_model.dart';
import 'package:baby_tracker/services/duration_formater.dart';
import 'package:baby_tracker/textstyles.dart';
import 'package:baby_tracker/view/feeding/feeding_view_controller.dart';
import 'package:baby_tracker/view/timer/timer_view_controller.dart';
import 'package:baby_tracker/widgets/mybutton.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:get/get.dart';


class FeedingView extends GetView<FeedingViewController> {


  @override


  const FeedingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  
  
  
  
 
    return SafeArea(
      child: Scaffold(
    

    
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(

              
              
              decoration:
           BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.center,

                //no gradient if dark theme is selected
                colors:Get.isDarkMode?[Colors.black,Colors.black26]:
                
                
                 [


                  Color.fromARGB(255, 240, 205, 110),
                  Color.fromARGB(255, 247, 164, 109),
                ],
              )
            ),
              width: Get.width,
              height: Get.height,
    
      
            ),
    
    
  

            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 50,horizontal: 10),
                child: Row(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                          
                          Obx(()=>
                             SizedBox(
                               height: Get.height*0.3,
                               child: SingleChildScrollView(
                                 child: Column(
                                  children: [

         


                                  
                                   RichText(
                                                           text: buildLefRightText("L","eft"),
                                                         ),
                                                            
                                                         //show finished duration on top
                                                         ...controller.leftBrFeedingDurationList.map((element) => Text(element.leftBrFeedDuration??"",style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.white,fontWeight: FontWeight.bold),)).toList()
                                                        
                                                         
                                                   
                                  ],

                                                           ),
                               ),
                             ),
                          ),
                          
    Obx(()=>
                             SizedBox(
                               height: Get.height*0.3,
                               child: SingleChildScrollView(
                                 child: Column(
                                  children: [Text(controller.leftBreastTimerDuration2.value.inSeconds.toString()),


                                   RichText(
                                                           text: buildLefRightText("R","ight"),
                                                         ),
                                                            
                                                         //show finished duration on top
                                                         ...controller.rightBrFeedingDurationList.map((element) => Text(element.rightBrFeedDuration??"",style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.white),)).toList()
                                                         
                                                   
                                  ],
                                                           ),
                               ),
                             ),
                          ),               
                ],),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LeftBr(),
    RightBr()

              ],
            ),
   Align(

     alignment: Alignment.bottomCenter,
     child: Container(

       margin: EdgeInsets.symmetric(horizontal: 12,vertical: 40),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.end,
         crossAxisAlignment: CrossAxisAlignment.center,
         
         children: [
       ///show total time e.g 15 minutes
       _buildTotalFeedingTime(),
       SizedBox(height: 20,),
               SizedBox(
     
                 width: Get.width*0.5,
                 height: 60,
                 child: Obx(()=>
                    MyButton(
                     side: BorderSide(color: Theme.of(context).backgroundColor,width: 2),
                      borderRadius: 20,
                     
                     buttonText: "Finish Feeding", onTap:

                     //when both brest icons are closed then disable finish button to tap
                     controller.areBothClosed==true?null:
                     
                     
                      (){
                      
                      
                      //  controller.finishFeeding();

                      controller.leftBreastTimerDuration2.value=Duration();
                      controller.stopIsolate();
                      
                      
                      
                     }),
                 ),
               ),
     
               _buildBottomButtonRow(),
     
     
        
              //  Container(height: 200,width: 300,color: Colors.blue,)
       
       
       
       ],),
     ),
   )
           
          ],
        ),
      ),
    );
    
  }

  TextSpan buildLefRightText(String first,String last) {
    return TextSpan(
  text: "${first}",
  style:Theme.of(Get.context!).textTheme.headline2?.copyWith(color:Colors.white,fontWeight: FontWeight.bold),
  children:  <TextSpan>[
    TextSpan(text: last,style:Theme.of(Get.context!).textTheme.headline2?.copyWith(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.white)),
  ],
);
  }
  
 Widget _buildTotalFeedingTime() {



return Obx(()=>
    RichText(
    text: TextSpan(
        text: '${(controller.getTotalFeedingTime.abs().inMinutes)}',
      style: Theme.of(Get.context!).textTheme.headline4?.copyWith(color: Colors.white),
      children:  <TextSpan>[
        TextSpan(text: " min", style: Theme.of(Get.context!).textTheme.headline6?.copyWith(fontWeight: FontWeight.bold,color: Colors.white)),
      ],
    ),
  ),
);


 }
 
  Widget _buildBottomButtonRow() {

return Row(
  
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [

InkWell(
  onTap: (){

    controller.stopIsolate();
      Get.back();

  },
  
  child: Image.asset(cancelButton,width: 50,))
,
InkWell(
  
  onTap: (){

controller.stopIsolate();

  },
  child: Image.asset(tile,width: 50,))

],);

  }

}

class RightBr extends GetView<FeedingViewController> {

   RightBr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
    
    alignment: Alignment.centerRight,
    
    children: [
    
    
     _addRightArch(color:Color.fromARGB(255, 250, 204, 218),   width: Get.width*0.3+35,
              height: Get.width*0.3+35),
    
            
    
    
               _addRightArch(color:Color.fromARGB(255, 247, 150, 179),  width: Get.width*0.3+20,
              height: Get.width*0.3+20,),
    
                _addRightArch(color:
                
                Get.isDarkMode?Colors.black:
                
                Colors.white,   width: Get.width*0.3,
              height: Get.width*0.3,child: Transform.rotate(
                angle: math.pi/2,
                child: Column(
              
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Feeding now",style:Theme.of(context).textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold,letterSpacing: 0.8)),
              
                  Obx(()=> Text(
                    
                 DurationServices.buildTime(   controller.rightBreastTimerDuration2.value)??"",style:Theme.of(context).textTheme.headline4,),)
              ,
              
PlayPauseButton()              
                  ],
                ),
              )),
    
    
    ],);
  }


  Widget _addRightArch({required double width,required double height,required Color color, Widget? child}) {

  
    return InkWell(
onTap: (){

  controller.toggleRight();
   controller.startIsolate();
},


      child: ScaleTransition(

         alignment: Alignment.center,
                                         scale: controller.animation,
        child: Obx(()=>
          controller.isRightClicked.isTrue?
      
           SizedBox(
      
      
             
                 width: width,height: height,
                  child: Transform.rotate(
                                   angle: -math.pi/2,

                    child: CustomPaint(
      
                      child: child,
                      painter: MyPainter(color),
                    ),
                  ),
                ):
          
           SizedBox(
                 width: width/3,height: height/3,
                  child: Transform.rotate(
                    angle:-math.pi/2,
                    child: CustomPaint(
                      painter: MyPainter(color),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

class LeftBr extends GetView<FeedingViewController> {

   LeftBr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
  
  alignment: Alignment.centerLeft,
  
  children: [


 _addLeftArch(color:Color.fromARGB(255, 250, 204, 218),   width: Get.width*0.3+35,
              height: Get.width*0.3+35),

            


               _addLeftArch(color:Color.fromARGB(255, 247, 150, 179),   width: Get.width*0.3+20,
              height: Get.width*0.3+20,),

                _addLeftArch(color:
                
                  Get.isDarkMode?Colors.black:
                
                
                Colors.white,   width: Get.width*0.3,
              height: Get.width*0.3,child: Transform.rotate(
                angle: -math.pi/2,
                child: Column(
              
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Feeding now",style: Theme.of(context).textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold,letterSpacing: 0.8)),
              //show timer for left 
                    Obx(()=> Text(
                      DurationServices.buildTime(  controller.leftBreastTimerDuration2.value)??"",style: Theme.of(context).textTheme.headline4,
                      
                    )),
                    PlayPauseButton()
                  ],
                ),
              )),


],);
  }



    Widget _addLeftArch({required double width,required double height,required Color color, Widget? child}) {

  //make only the first arch clickable
    return InkWell(
onTap: ()async{
controller.toggleLeft();


 controller.startIsolate();

},



      child: ScaleTransition(

         alignment: Alignment.center,
                                         scale: controller.animation,
        child: Obx(()=>

        //if clicked then show large arch 
          controller.isLeftClicked.isTrue?


      
           SizedBox(
      
      
             
                 width: width,height: height,
                  child: Transform.rotate(
                    angle: math.pi/2,
                    child: CustomPaint(
      
                      child: child,
                      painter: MyPainter(color),
                    ),
                  ),
                ):
          //else show samall arches e.g half width and half height
           SizedBox(
                 width: width/3,height: height/3,
                  child: Transform.rotate(
                    angle:math.pi/2,
                    child: CustomPaint(
                      painter: MyPainter(color),
                    ),
                  ),
                ),
        ),
      ),
    );
  }






 


  }

  class PlayPauseButton extends GetView<FeedingViewController>{
    const PlayPauseButton({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return Obx(()=>
FloatingActionButton(onPressed: (){

 controller.isStarted?controller.stopIsolate():controller.startIsolate();


}, child:  controller.isRunning.isFalse?Icon(Icons.play_arrow,color: Colors.black,):Icon(Icons.pause,color: Colors.black,)),
);
    }
  }



// This is the Painter class
class MyPainter extends CustomPainter {

  final Color color;

  MyPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final redCircle = Paint()
      ..color =color
      
      ..style = PaintingStyle.fill;
    final arcRect = Rect.fromCircle(
        center: size.bottomCenter(Offset.zero), radius: size.shortestSide);
    canvas.drawArc(arcRect, 0, -math.pi, false, redCircle);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => false;
}