import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'User.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class DBService {

  String uid ;
  DBService({ required this.uid });

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('Staff');

  Future updateUserData(String username , String phonenumber , String email , String designation , String dept , String imgurl) async {
    return await userCollection.doc(uid).set({
      'UserName': username.isNotEmpty ? username : "Enter Name"  ,
      'PhoneNumber': phonenumber.isNotEmpty ?phonenumber:"Enter Phone No",
      'Email': email.isNotEmpty ?email:"Enter Email",
      'designation': designation.isNotEmpty ? designation :"Enter Designation",
      'dept' : dept.isNotEmpty ? dept :"Select Dept",
      'imgurl':imgurl.isNotEmpty ? imgurl : "Upload Image"
    });
  }

  UserData _userDat(DocumentSnapshot snapshot) {
    return UserData(phonenumber: snapshot['PhoneNumber'], username: snapshot['UserName'],email: snapshot['Email'],designation: snapshot['designation'], dept: snapshot['dept'], imgurl:snapshot['imgurl']) ;
  }

  List<UserData> _uselist(QuerySnapshot snapshot) {
    return snapshot.docs.map((e){
      if (kDebugMode) {
        print('==>$e');
      }
        return UserData(
          username: e['UserName'] ?? '',
          phonenumber: e['PhoneNumber'] ?? '',
          email: e['Email'] ?? '',
          designation: e['designation'] ?? '',
          dept: e['dept'] ?? '',
          imgurl: e['imgurl'],
      );
    }).toList() ;
  }

  Stream <List<UserData>>? get user {
        return userCollection.snapshots()
        .map(_uselist);
  }

  Stream<UserData> get userData {
    return userCollection.doc(uid).snapshots().map((_userDat));
  }
}

class Storage {

  static UploadTask? uploadFile(
        String filePath,
        String fileName,
      )  {
        File file = File(filePath);
        try {
          return FirebaseStorage.instance.ref('Staff/cse/$fileName').putFile(file);
        }on FirebaseException catch (e){
          if (kDebugMode) {
            print(e);
            return null ;
          }
        }
        return null;
  }
}