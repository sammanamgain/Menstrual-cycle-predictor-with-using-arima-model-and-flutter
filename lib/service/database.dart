import "package:cloud_firestore/cloud_firestore.dart";
import 'package:menstrual_period_tracker/input/input3.dart';


class DatabaseService {
  final String ?uid;
  DatabaseService({this.uid});

  final CollectionReference dataStore = FirebaseFirestore.instance.collection('Details');
  Future updateUserData(int periodDate, lengthofDays, lengthofPeriod, age) async
  {
    return await dataStore.doc(uid).set(
      {
        'Period Date' : periodDate,
        'Cycle Length' : periodDate,
        'Length of period' : periodDate,
        'Age' : periodDate,
      }
    );
  }
  //get brew stream

  Stream<QuerySnapshot> get details{
    return dataStore.snapshots();
  }

}