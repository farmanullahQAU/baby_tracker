

import 'package:baby_tracker/constants/firestore_constants.dart';
import 'package:baby_tracker/models/brest_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices{

Future<void> addHistory(FeedModel feedModel){




 return  FirebaseFirestore.instance.collection(FirestoreConstants.feedingHistoryCollection).add(feedModel.toMap());
}

static final history = FirebaseFirestore.instance.collection(FirestoreConstants.feedingHistoryCollection)
  .orderBy(FirestoreConstants.dateFinished, descending: true)
  .withConverter<FeedModel>(
     fromFirestore: (snapshot, _) => FeedModel.fromMap(snapshot.data()!,snapshot.id),
     toFirestore: (user, _) => user.toMap(),
   );

    

  

  }
  