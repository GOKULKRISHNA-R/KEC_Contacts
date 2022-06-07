import 'package:contacts_app_kec/Pages/Log%20Screen/Authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Services/User.dart';
import 'Home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserCls?>(context) ;

    if(user == null)
    {
      return const Authenticate();
    }else {
      return const Home();
    }

  }
}
