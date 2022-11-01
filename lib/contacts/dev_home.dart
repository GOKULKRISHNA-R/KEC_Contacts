import 'package:contacts_app_kec/Shared/background.dart';
import 'package:contacts_app_kec/contacts/Services/userList.dart';
import 'package:contacts_app_kec/contacts/Services/user.dart';
import 'package:contacts_app_kec/contacts/Services/db.dart';
import 'package:contacts_app_kec/Shared/design.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../developer/developer_home.dart';

class ContactDEVHome extends StatefulWidget {
  const ContactDEVHome({Key? key}) : super(key: key);

  @override
  State<ContactDEVHome> createState() => _ContactDEVHomeState();
}

class _ContactDEVHomeState extends State<ContactDEVHome> {
  @override
  Widget build(BuildContext context) {
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
          mystr: '',
          dept: 'CSE',
          catogory: 'Developer',
        )),
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
            leading: const Icon(
              Icons.code_rounded,
              color: kPrimaryColor,
            ),
            title: const Text(
              "DEVELOPER TEAM",
              style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Aboreto"),
            ),
            backgroundColor: kPrimaryLightColor,
            actions: [
              IconButton(
                color: kPrimaryColor,
                icon: const Icon(Icons.home),
                onPressed: () {
                  Get.offAll(const DevHome());
                },
              ),
              const SizedBox(
                width: 30,
              )
            ]),
      ),
    );
  }
}
