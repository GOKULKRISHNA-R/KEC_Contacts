import 'package:contacts_app_kec/Academic%20Shedule/AS_DB_Service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../Shared/design.dart';

class ASList extends StatelessWidget {
  const ASList({super.key});

  @override
  Widget build(BuildContext context) {
    final AS = Provider.of<List<SRow>>(context);

    SRow row1;
    SRow row2;
    SRow row3;
    SRow row4;
    SRow row5;
    SRow row6;
    SRow row7;
    SRow row8;
    SRow row9;
    SRow row10;
    SRow row11;

    if (AS.length == 11) {
      row1 = AS.where((element) => element.docId == "row1").toList()[0];
      row2 = AS.where((element) => element.docId == "row2").toList()[0];
      row3 = AS.where((element) => element.docId == "row3").toList()[0];
      row4 = AS.where((element) => element.docId == "row4").toList()[0];
      row5 = AS.where((element) => element.docId == "row5").toList()[0];
      row6 = AS.where((element) => element.docId == "row6").toList()[0];
      row7 = AS.where((element) => element.docId == "row7").toList()[0];
      row8 = AS.where((element) => element.docId == "row8").toList()[0];
      row9 = AS.where((element) => element.docId == "row9").toList()[0];
      row10 = AS.where((element) => element.docId == "row10").toList()[0];
      row11 = AS.where((element) => element.docId == "row11").toList()[0];
    } else {
      row1 = SRow(
          docId: "docId",
          ESEBegins: "ESEBegins",
          caTest1: "caTest1",
          caTest2: "caTest2",
          evenSemReopens: "evenSemReopens",
          practicalExamAndStudyHoliday: "practicalExamAndStudyHoliday",
          prog: "prog",
          reg: "reg",
          sem: "sem",
          semTermBegins: "semTermBegins",
          semTermEnds: "semTermEnds");
      row2 = SRow(
          docId: "docId",
          ESEBegins: "ESEBegins",
          caTest1: "caTest1",
          caTest2: "caTest2",
          evenSemReopens: "evenSemReopens",
          practicalExamAndStudyHoliday: "practicalExamAndStudyHoliday",
          prog: "prog",
          reg: "reg",
          sem: "sem",
          semTermBegins: "semTermBegins",
          semTermEnds: "semTermEnds");
      row3 = SRow(
          docId: "docId",
          ESEBegins: "ESEBegins",
          caTest1: "caTest1",
          caTest2: "caTest2",
          evenSemReopens: "evenSemReopens",
          practicalExamAndStudyHoliday: "practicalExamAndStudyHoliday",
          prog: "prog",
          reg: "reg",
          sem: "sem",
          semTermBegins: "semTermBegins",
          semTermEnds: "semTermEnds");
      row4 = SRow(
          docId: "docId",
          ESEBegins: "ESEBegins",
          caTest1: "caTest1",
          caTest2: "caTest2",
          evenSemReopens: "evenSemReopens",
          practicalExamAndStudyHoliday: "practicalExamAndStudyHoliday",
          prog: "prog",
          reg: "reg",
          sem: "sem",
          semTermBegins: "semTermBegins",
          semTermEnds: "semTermEnds");
      row5 = SRow(
          docId: "docId",
          ESEBegins: "ESEBegins",
          caTest1: "caTest1",
          caTest2: "caTest2",
          evenSemReopens: "evenSemReopens",
          practicalExamAndStudyHoliday: "practicalExamAndStudyHoliday",
          prog: "prog",
          reg: "reg",
          sem: "sem",
          semTermBegins: "semTermBegins",
          semTermEnds: "semTermEnds");
      row6 = SRow(
          docId: "docId",
          ESEBegins: "ESEBegins",
          caTest1: "caTest1",
          caTest2: "caTest2",
          evenSemReopens: "evenSemReopens",
          practicalExamAndStudyHoliday: "practicalExamAndStudyHoliday",
          prog: "prog",
          reg: "reg",
          sem: "sem",
          semTermBegins: "semTermBegins",
          semTermEnds: "semTermEnds");
      row7 = SRow(
          docId: "docId",
          ESEBegins: "ESEBegins",
          caTest1: "caTest1",
          caTest2: "caTest2",
          evenSemReopens: "evenSemReopens",
          practicalExamAndStudyHoliday: "practicalExamAndStudyHoliday",
          prog: "prog",
          reg: "reg",
          sem: "sem",
          semTermBegins: "semTermBegins",
          semTermEnds: "semTermEnds");
      row8 = SRow(
          docId: "docId",
          ESEBegins: "ESEBegins",
          caTest1: "caTest1",
          caTest2: "caTest2",
          evenSemReopens: "evenSemReopens",
          practicalExamAndStudyHoliday: "practicalExamAndStudyHoliday",
          prog: "prog",
          reg: "reg",
          sem: "sem",
          semTermBegins: "semTermBegins",
          semTermEnds: "semTermEnds");
      row9 = SRow(
          docId: "docId",
          ESEBegins: "ESEBegins",
          caTest1: "caTest1",
          caTest2: "caTest2",
          evenSemReopens: "evenSemReopens",
          practicalExamAndStudyHoliday: "practicalExamAndStudyHoliday",
          prog: "prog",
          reg: "reg",
          sem: "sem",
          semTermBegins: "semTermBegins",
          semTermEnds: "semTermEnds");
      row10 = SRow(
          docId: "docId",
          ESEBegins: "ESEBegins",
          caTest1: "caTest1",
          caTest2: "caTest2",
          evenSemReopens: "evenSemReopens",
          practicalExamAndStudyHoliday: "practicalExamAndStudyHoliday",
          prog: "prog",
          reg: "reg",
          sem: "sem",
          semTermBegins: "semTermBegins",
          semTermEnds: "semTermEnds");
      row11 = SRow(
          docId: "docId",
          ESEBegins: "ESEBegins",
          caTest1: "caTest1",
          caTest2: "caTest2",
          evenSemReopens: "evenSemReopens",
          practicalExamAndStudyHoliday: "practicalExamAndStudyHoliday",
          prog: "prog",
          reg: "reg",
          sem: "sem",
          semTermBegins: "semTermBegins",
          semTermEnds: "semTermEnds");
    }

    return Scaffold(
      backgroundColor: kPrimaryMediumColor,
      appBar: AppBar(
        leading: Icon(Icons.home, color: Colors.blueGrey[600]),
        backgroundColor: kPrimaryLightColor,
        actions: [
          Center(
            child: Text(
              "Academic Schedule Odd Sem 2022-23",
              style: TextStyle(
                  color: Colors.blueGrey[700], fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.school,
              color: Colors.blueGrey[600],
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Row(
            children: [
              SizedBox(
                  width: 54,
                  height: Get.height,
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const HeadTexT(
                        e: "Prog.",
                      ),
                      TexT(
                        e: row1.prog,
                      ),
                      TexT(
                        e: row2.prog,
                      ),
                      TexT(
                        e: row3.prog,
                      ),
                      TexT(
                        e: row4.prog,
                      ),
                      TexT(
                        e: row5.prog,
                      ),
                      TexT(
                        e: row6.prog,
                      ),
                      TexT(
                        e: row7.prog,
                      ),
                      TexT(
                        e: row8.prog,
                      ),
                      TexT(
                        e: row9.prog,
                      ),
                      TexT(
                        e: row10.prog,
                      ),
                      TexT(
                        e: row11.prog,
                      ),
                    ],
                  )),
              SizedBox(
                  width: 45,
                  height: Get.height,
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const HeadTexT(
                        e: "Reg.",
                      ),
                      TexT(
                        e: row1.reg,
                      ),
                      TexT(
                        e: row2.reg,
                      ),
                      TexT(
                        e: row3.reg,
                      ),
                      TexT(
                        e: row4.reg,
                      ),
                      TexT(
                        e: row5.reg,
                      ),
                      TexT(
                        e: row6.reg,
                      ),
                      TexT(
                        e: row7.reg,
                      ),
                      TexT(
                        e: row8.reg,
                      ),
                      TexT(
                        e: row9.reg,
                      ),
                      TexT(
                        e: row10.reg,
                      ),
                      TexT(
                        e: row11.reg,
                      ),
                    ],
                  )),
              SizedBox(
                  width: 30,
                  height: Get.height,
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const HeadTexT(
                        e: 'Sem.',
                      ),
                      TexT(
                        e: row1.sem,
                      ),
                      TexT(
                        e: row2.sem,
                      ),
                      TexT(
                        e: row3.sem,
                      ),
                      TexT(
                        e: row4.sem,
                      ),
                      TexT(
                        e: row5.sem,
                      ),
                      TexT(
                        e: row6.sem,
                      ),
                      TexT(
                        e: row7.sem,
                      ),
                      TexT(
                        e: row8.sem,
                      ),
                      TexT(
                        e: row9.sem,
                      ),
                      TexT(
                        e: row10.sem,
                      ),
                      TexT(
                        e: row11.sem,
                      ),
                    ],
                  )),
              SizedBox(
                height: Get.height,
                width: Get.width - 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 59,
                          child: Row(children: const [
                            HeadTexT(e: "Sem Term Begins"),
                            HeadTexT(e: "CAT - 1"),
                            HeadTexT(e: "CAT - 2"),
                            HeadTexT(e: "Sem Term Ends"),
                            HeadTexT(e: "Practical Exam and Study Holidays"),
                            HeadTexT(e: "ESE Begins"),
                            HeadTexT(e: "Even Sem Reopens"),
                          ]),
                        ),
                        Container(
                          height: 59,
                          child: Row(children: [
                            TexT(e: row1.semTermBegins),
                            TexT(e: row1.caTest1),
                            TexT(e: row1.caTest2),
                            TexT(e: row1.semTermEnds),
                            TexT(e: row1.practicalExamAndStudyHoliday),
                            TexT(e: row1.ESEBegins),
                            TexT(e: row1.evenSemReopens),
                          ]),
                        ),
                        Container(
                          height: 59,
                          child: Row(children: [
                            TexT(e: row2.semTermBegins),
                            TexT(e: row2.caTest1),
                            TexT(e: row2.caTest2),
                            TexT(e: row2.semTermEnds),
                            TexT(e: row2.practicalExamAndStudyHoliday),
                            TexT(e: row2.ESEBegins),
                            TexT(e: row2.evenSemReopens),
                          ]),
                        ),
                        Container(
                          height: 59,
                          child: Row(children: [
                            TexT(e: row3.semTermBegins),
                            TexT(e: row3.caTest1),
                            TexT(e: row3.caTest2),
                            TexT(e: row3.semTermEnds),
                            TexT(e: row3.practicalExamAndStudyHoliday),
                            TexT(e: row3.ESEBegins),
                            TexT(e: row3.evenSemReopens),
                          ]),
                        ),
                        Container(
                          height: 59,
                          child: Row(children: [
                            TexT(e: row4.semTermBegins),
                            TexT(e: row4.caTest1),
                            TexT(e: row4.caTest2),
                            TexT(e: row4.semTermEnds),
                            TexT(e: row4.practicalExamAndStudyHoliday),
                            TexT(e: row4.ESEBegins),
                            TexT(e: row4.evenSemReopens),
                          ]),
                        ),
                        Container(
                          height: 59,
                          child: Row(children: [
                            TexT(e: row5.semTermBegins),
                            TexT(e: row5.caTest1),
                            TexT(e: row5.caTest2),
                            TexT(e: row5.semTermEnds),
                            TexT(e: row5.practicalExamAndStudyHoliday),
                            TexT(e: row5.ESEBegins),
                            TexT(e: row5.evenSemReopens),
                          ]),
                        ),
                        Container(
                          height: 59,
                          child: Row(children: [
                            TexT(e: row6.semTermBegins),
                            TexT(e: row6.caTest1),
                            TexT(e: row6.caTest2),
                            TexT(e: row6.semTermEnds),
                            TexT(e: row6.practicalExamAndStudyHoliday),
                            TexT(e: row6.ESEBegins),
                            TexT(e: row6.evenSemReopens),
                          ]),
                        ),
                        Container(
                          height: 59,
                          child: Row(children: [
                            TexT(e: row7.semTermBegins),
                            TexT(e: row7.caTest1),
                            TexT(e: row7.caTest2),
                            TexT(e: row7.semTermEnds),
                            TexT(e: row7.practicalExamAndStudyHoliday),
                            TexT(e: row7.ESEBegins),
                            TexT(e: row7.evenSemReopens),
                          ]),
                        ),
                        Container(
                          height: 59,
                          child: Row(children: [
                            TexT(e: row8.semTermBegins),
                            TexT(e: row8.caTest1),
                            TexT(e: row8.caTest2),
                            TexT(e: row8.semTermEnds),
                            TexT(e: row8.practicalExamAndStudyHoliday),
                            TexT(e: row8.ESEBegins),
                            TexT(e: row8.evenSemReopens),
                          ]),
                        ),
                        Container(
                          height: 59,
                          child: Row(children: [
                            TexT(e: row9.semTermBegins),
                            TexT(e: row9.caTest1),
                            TexT(e: row9.caTest2),
                            TexT(e: row9.semTermEnds),
                            TexT(e: row9.practicalExamAndStudyHoliday),
                            TexT(e: row9.ESEBegins),
                            TexT(e: row9.evenSemReopens),
                          ]),
                        ),
                        Container(
                          height: 59,
                          child: Row(children: [
                            TexT(e: row10.semTermBegins),
                            TexT(e: row10.caTest1),
                            TexT(e: row10.caTest2),
                            TexT(e: row10.semTermEnds),
                            TexT(e: row10.practicalExamAndStudyHoliday),
                            TexT(e: row10.ESEBegins),
                            TexT(e: row10.evenSemReopens),
                          ]),
                        ),
                        Container(
                          height: 59,
                          child: Row(children: [
                            TexT(e: row11.semTermBegins),
                            TexT(e: row11.caTest1),
                            TexT(e: row11.caTest2),
                            TexT(e: row11.semTermEnds),
                            TexT(e: row11.practicalExamAndStudyHoliday),
                            TexT(e: row11.ESEBegins),
                            TexT(e: row11.evenSemReopens),
                          ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TexT extends StatelessWidget {
  const TexT({
    Key? key,
    required this.e,
  }) : super(key: key);
  final String e;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: Get.height / 14.49,
      alignment: Alignment.center,
      color: kPrimaryLightColor,
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
      child: Text(
        e,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 13, color: kPrimaryMediumColor),
      ),
    );
  }
}

class HeadTexT extends StatelessWidget {
  const HeadTexT({
    Key? key,
    required this.e,
  }) : super(key: key);
  final String e;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: Get.height / 14.49,
      alignment: Alignment.center,
      color: kPrimaryLightColor,
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
      child: Text(
        e,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
