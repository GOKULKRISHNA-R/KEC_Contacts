import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'user.dart';

class DBService {
  String uid;

  DBService({required this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('KEC Contacts');

  UDatain _userDat(DocumentSnapshot snapshot) {
    return UDatain(
        phonenumber: snapshot['phonenumber'],
        username: snapshot['username'],
        email: snapshot['email'],
        designation: snapshot['designation'],
        dept: snapshot['dept'],
        imgurl: snapshot['imgurl'],
        category: snapshot['category'],
        whatsappnumber: snapshot['whatsappnumber'],
        roomNo: snapshot['roomNo'],
        index: snapshot['index']);
  }

  List<UDatain> _uselist(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      // log(e.data().toString());
      return UDatain(
        username: e['username'] ?? '',
        phonenumber: e['phonenumber'] ?? '',
        email: e['email'] ?? '',
        designation: e['designation'] ?? '',
        dept: e['dept'] ?? '',
        imgurl: e['imgurl'],
        category: e['category'] ?? '',
        whatsappnumber: e['whatsappnumber'],
        roomNo: e['roomNo'],
        index: e['index'],
      );
    }).toList();
  }

  Stream<List<UDatain>>? get user {
    return userCollection.snapshots().map(_uselist);
  }

  Stream<UDatain> get userData {
    return userCollection.doc(uid).snapshots().map((_userDat));
  }
}
