import 'package:cloud_firestore/cloud_firestore.dart';

void addCycleData(String? userId,int cycleLength, String formattedDate) {
  // Get the current date in the Nepali calendar
  //NepaliDateTime now = NepaliDateTime.now();
 // String formattedDate = '${now.year}-${now.month}-${now.day}';

  // Create a map with the timestamp and cycle length
  Map<String, dynamic> cycleData = {
    "cycle length": {
      formattedDate: cycleLength,
    },
  };

  // Add the cycle data to Firestore
  FirebaseFirestore.instance
      .collection('User Details')
      .doc(userId)
      .set(cycleData, SetOptions(merge: true));
}


