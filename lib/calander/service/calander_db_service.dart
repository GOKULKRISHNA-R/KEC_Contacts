import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class CalanderDate {
  Timestamp date;
  List<dynamic> event;
  CalanderDate({required this.date, required this.event});
}

class CalanderDBService {
  String uid;
  CalanderDBService({required this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Calender events');

  CalanderDate _userDat(DocumentSnapshot snapshot) {
    return CalanderDate(date: snapshot['date'], event: snapshot['event']);
  }

  List<CalanderDate> _uselist(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      // log(e.id.toString());
      return CalanderDate(
        date: e['date'] ?? DateTime.now(),
        event: e['event'] ?? '',
      );
    }).toList();
  }

  Stream<List<CalanderDate>>? get user {
    return userCollection.snapshots().map(_uselist);
  }

  Stream<CalanderDate> get userData {
    return userCollection.doc(uid).snapshots().map((_userDat));
  }
}
