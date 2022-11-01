import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

class ASDBService {
  String uid;

  ASDBService({required this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Academic Schedule Text');

  SRow _userDat(DocumentSnapshot snapshot) {
    // log(snapshot.id);
    return SRow(
        ESEBegins: snapshot['ESEBegins'],
        caTest1: snapshot['caTest1'],
        caTest2: snapshot['caTest2'],
        evenSemReopens: snapshot['evenSemReopens'],
        practicalExamAndStudyHoliday: snapshot['practicalExamAndStudyHoliday'],
        prog: snapshot['prog'],
        reg: snapshot['reg'],
        sem: snapshot['sem'],
        semTermBegins: snapshot['semTermBegins'],
        semTermEnds: snapshot['semTermEnds'],
        docId: snapshot.id);
  }

  List<SRow> _uselist(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      // log(e.id);
      // log(e.data().toString());
      return SRow(
          ESEBegins: e['ESEBegins'] ?? '',
          caTest1: e['caTest1'] ?? '',
          caTest2: e['caTest2'] ?? '',
          evenSemReopens: e['evenSemReopens'] ?? '',
          practicalExamAndStudyHoliday: e['practicalExamAndStudyHoliday'] ?? '',
          prog: e['prog'] ?? '',
          reg: e['reg'] ?? '',
          sem: e['sem'] ?? '',
          semTermBegins: e['semTermBegins'] ?? '',
          semTermEnds: e['semTermEnds'],
          docId: e.id);
    }).toList();
  }

  Stream<List<SRow>>? get user {
    return userCollection.snapshots().map(_uselist);
  }

  Stream<SRow> get userData {
    return userCollection.doc(uid).snapshots().map((_userDat));
  }
}

class SRow {
  final String docId;
  final String ESEBegins;
  final String caTest1;
  final String caTest2;
  final String evenSemReopens;
  final String practicalExamAndStudyHoliday;
  final String prog;
  final String reg;
  final String sem;
  final String semTermBegins;
  final String semTermEnds;

  SRow({
    required this.docId,
    required this.ESEBegins,
    required this.caTest1,
    required this.caTest2,
    required this.evenSemReopens,
    required this.practicalExamAndStudyHoliday,
    required this.prog,
    required this.reg,
    required this.sem,
    required this.semTermBegins,
    required this.semTermEnds,
  });
}
