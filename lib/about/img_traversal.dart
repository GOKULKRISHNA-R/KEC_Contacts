import 'dart:developer';
import 'package:contacts_app_kec/about/service/abt_db_service.dart';
import 'package:contacts_app_kec/about/service/imglist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AbtImgs extends StatelessWidget {
  const AbtImgs({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<AboutImage>>.value(
      value: AbtDBService(uid: '').user,
      catchError: (_, err) {
        log("=>$err");

        return [AboutImage(id: "###", imgurl: "#####")].toList();
      },
      initialData: [
        AboutImage(
            id: "Loading...",
            imgurl:
                "'https://firebasestorage.googleapis.com/v0/b/kec-contacts-2gk-ar-ch-aa.appspot.com/o/Staff%2Floading.jpg?alt=media&token=0f0a2919-ad3d-4350-b297-cdb3609c11ee'")
      ].toList(),
      child: AboutImageList(),
    );
  }
}
