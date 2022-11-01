import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_app_kec/calander/service/calander_db_service.dart';
import 'package:contacts_app_kec/calander/service/eventlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalanderHome extends StatelessWidget {
  const CalanderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<CalanderDate>>.value(
      value: CalanderDBService(uid: '').user,
      catchError: (_, err) {
        log("=>$err");
        return [
          CalanderDate(
              date: Timestamp.fromDate(DateTime.now()),
              event: ["#####"])
        ];
      },
      initialData: [
        CalanderDate(
            date: Timestamp.fromDate(DateTime.now()),
            event: ["Loading..."])
      ],
      child: const CalanderEventList(),
    );
  }
}
