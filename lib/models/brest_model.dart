import 'package:baby_tracker/services/firestore_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constants/firestore_constants.dart';

class FeedModel {
 FeedModel({ 
   required this.totalFeedingDuration,
   
   required this.position,this.leftBrFeedDuration,this.rightBrFeedDuration,required this.dateFinished});
late String totalFeedingDuration;
  late DateTime dateFinished;
  late BrPosition position;
 late final String? leftBrFeedDuration;
 late final String? rightBrFeedDuration;
 late bool isBothFeeded;
    Map<String, dynamic> toMap() {

      print(checkPosition(position));
    return {
    FirestoreConstants.dateFinished:dateFinished,
    FirestoreConstants.leftBrFeedDuration:this.leftBrFeedDuration,
    FirestoreConstants.rightBrFeedDuration:rightBrFeedDuration,
    FirestoreConstants.totalFeedingDuration:totalFeedingDuration,
  FirestoreConstants.position:checkPosition(position),



  

    };
  }


   FeedModel.fromMap( Map<String, dynamic>  data,id) {

     


      dateFinished=(DateTime.fromMicrosecondsSinceEpoch(data[FirestoreConstants.dateFinished].microsecondsSinceEpoch));
  position=convertPosition(data[FirestoreConstants.position])!;

  leftBrFeedDuration=data[FirestoreConstants.leftBrFeedDuration];

  rightBrFeedDuration=data[FirestoreConstants.rightBrFeedDuration];

  totalFeedingDuration=data[FirestoreConstants.totalFeedingDuration];

  }
 String checkPosition(BrPosition position)

{

  switch(position){
    case BrPosition.left:
    
    
    return "left";
    case BrPosition.right:
    return 
    "right";
  }
  
}

BrPosition? convertPosition(String position){
switch(position){
case "left":

return 
BrPosition.left;
case "right":

return BrPosition.right;

}

}
}



enum BrPosition {left,right}