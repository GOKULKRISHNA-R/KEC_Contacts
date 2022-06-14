import 'package:contacts_app_kec/Shared/Design.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: kPrimaryLightColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            SpinKitWanderingCubes(
              color: kPrimaryColor,
              size: 50 ,
            ),

          ],
        )
    );
  }
}
