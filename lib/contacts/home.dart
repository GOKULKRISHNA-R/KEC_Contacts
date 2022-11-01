import 'package:contacts_app_kec/Shared/background.dart';
import 'package:contacts_app_kec/contacts/Services/userList.dart';
import 'package:contacts_app_kec/contacts/Services/user.dart';
import 'package:contacts_app_kec/contacts/Services/db.dart';
import 'package:contacts_app_kec/Shared/design.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../Nav_Home.dart';

class ContactHome extends StatefulWidget {
  const ContactHome({Key? key}) : super(key: key);

  @override
  State<ContactHome> createState() => _ContactHomeState();
}

class _ContactHomeState extends State<ContactHome> {
  String str = '';
  String catogory = 'Teaching';
  String dept = 'CSE';

  final List<String> department = [
    'ALL DEPT',
    'Artificial Intelligence',
    'Automobile Engineering',
    'CSE',
    'CSD',
    'CIVIL ENGINEERING',
    'Computer Applications',
    'CT-UG',
    'CT-PG',
    'Chemistry',
    'ECE',
    'EEE',
    'EIE',
    'English',
    'Food Technology',
    'IT',
    'IIP Cell',
    'MTS',
    'Mechanical',
    'MBA',
    'Mathematics',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return StreamProvider<List<UDatain>>.value(
      value: DBService(uid: '').user,
      catchError: (_, err) {
        if (kDebugMode) {
          print('===>>>$err');
        }

        return [
          UDatain(
              username: '######',
              phonenumber: '######',
              email: ['######'],
              designation: '######',
              dept: '######',
              imgurl: '######',
              category: '######',
              whatsappnumber: '######',
              roomNo: '######',
              index: 0)
        ].toList();
      },
      initialData: [
        UDatain(
          username: 'Loading...',
          phonenumber: 'Loading...',
          email: ['Loading...'],
          designation: 'Loading...',
          dept: 'Loading...',
          imgurl:
              'https://firebasestorage.googleapis.com/v0/b/kec-contacts-2gk-ar-ch-aa.appspot.com/o/Staff%2Floading.jpg?alt=media&token=0f0a2919-ad3d-4350-b297-cdb3609c11ee',
          category: 'Loading...',
          whatsappnumber: 'Loading...',
          roomNo: 'Loading...',
          index: 0,
        )
      ].toList(),
      child: Scaffold(
        body: Background(
            child: Userlist(
          mystr: str,
          dept: dept,
          catogory: catogory,
        )),
        backgroundColor: kPrimaryColor,
        appBar: contactPageAppBar(size),
      ),
    );
  }

  AppBar contactPageAppBar(Size size) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0.0,
      toolbarHeight: size.height * 0.21,
      flexibleSpace: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.01),
              child: Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text(""),
                  ),
                  IconButton(
                    icon: const Icon(Icons.home, color: Colors.white),
                    onPressed: () {
                      Get.offAll(const NavigationHome());
                    },
                  ),
                  const Expanded(
                    flex: 1,
                    child: Text(""),
                  ),
                  const Text(
                    "KEC Contacts",
                    style: TextStyle(
                      color: kPrimaryLightColor,
                      fontSize: 27,
                      fontWeight: FontWeight.w900,
                      fontFamily: "Aboreto",
                    ),
                  ),
                  const Expanded(
                    flex: 8,
                    child: Text(""),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: const BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: TextFormField(
                        cursorColor: kPrimaryColor,
                        initialValue: str,
                        decoration: const InputDecoration(
                            hintText: 'Search',
                            prefixIcon: Icon(
                              Icons.search_rounded,
                              color: kPrimaryColor,
                            ),
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: kPrimaryColor,
                            )),
                        onChanged: (val) => setState(() => str = val),
                      )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: DropdownButtonFormField<String>(
                        alignment: Alignment.centerLeft,
                        menuMaxHeight: Get.height * 0.4,
                        dropdownColor: kPrimaryLightColor,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        hint: Text(dept),
                        onChanged: (val) => setState(() => dept = val!),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        items: department.map((e) {
                          String val = e;
                          if (e == 'Artificial Intelligence') {
                            val = "AI";
                          } else if (e == 'Automobile Engineering') {
                            val = "AUTO";
                          } else if (e == 'CIVIL ENGINEERING') {
                            val = "CIVIL";
                          } else if (e == 'Computer Applications') {
                            val = "CA";
                          } else if (e == 'Food Technology') {
                            val = "FT";
                          } else if (e == 'Mechanical') {
                            val = "MECH";
                          } else if (e == 'Mathematics') {
                            val = 'MATHS';
                          }

                          return DropdownMenuItem<String>(
                              value: e,
                              child: Text(
                                val,
                                style: const TextStyle(
                                  color: kPrimaryColor,
                                ),
                              ));
                        }).toList(),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: kPrimaryLightColor,
              height: size.height * 0.055,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: catogory == "Teaching"
                              ? MaterialStateProperty.all(kPrimaryColor)
                              : MaterialStateProperty.all(kPrimaryLightColor)),
                      onPressed: () {
                        setState(() {
                          str = '';
                          catogory = "Teaching";
                        });
                      },
                      child: Row(
                        children: [
                          Text(
                            "Teaching Staff",
                            style: TextStyle(
                                color: catogory == "Teaching"
                                    ? kPrimaryLightColor
                                    : kPrimaryColor),
                          ),
                          catogory == "Teaching"
                              ? Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Container(
                                    width: 5.0,
                                    height: 5.0,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                  ),
                                )
                              : const SizedBox(
                                  child: Text(""),
                                )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: kPrimaryColor,
                    width: 2,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: catogory == "Non Teaching"
                            ? MaterialStateProperty.all(kPrimaryColor)
                            : MaterialStateProperty.all(kPrimaryLightColor),
                      ),
                      onPressed: () {
                        setState(() {
                          str = '';
                          catogory = "Non Teaching";
                        });
                      },
                      child: Row(
                        children: [
                          Text("Non Teaching Staff",
                              style: TextStyle(
                                  color: catogory == "Non Teaching"
                                      ? kPrimaryLightColor
                                      : kPrimaryColor)),
                          catogory == "Non Teaching"
                              ? Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Container(
                                    width: 5.0,
                                    height: 5.0,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                  ),
                                )
                              : const SizedBox(
                                  child: Text(""),
                                )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
