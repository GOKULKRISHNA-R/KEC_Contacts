import 'dart:developer';

import 'package:contacts_app_kec/Academic%20Shedule/AS_DB_Service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AS_list.dart';

class AcademicSheduleHome extends StatelessWidget {
  const AcademicSheduleHome({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<SRow>>.value(
      value: ASDBService(uid: '').user,
      catchError: (_, err) {
        log("=>$err");
        return [
          SRow(
              ESEBegins: "ESEBegins",
              caTest1: "caTest1",
              caTest2: "caTest2",
              evenSemReopens: "evenSemReopens",
              practicalExamAndStudyHoliday: "practicalExamAndStudyHoliday",
              prog: "prog",
              reg: "reg",
              sem: "sem",
              semTermBegins: "semTermBegins",
              semTermEnds: "semTermEnds",
              docId: 'docId')
        ];
      },
      initialData: [
        SRow(
            ESEBegins: "Loading...",
            caTest1: "Loading...",
            caTest2: "Loading...",
            evenSemReopens: "Loading...",
            practicalExamAndStudyHoliday: "Loading...",
            prog: "Loading...",
            reg: "Loading...",
            sem: "Loading...",
            semTermBegins: "Loading...",
            semTermEnds: "Loading...",
            docId: 'Loading...')
      ],
      child: const ASList(),
    );
  }
}
