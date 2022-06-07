import 'package:contacts_app_kec/Pages/Log%20Screen/Login_Screen.dart';
import 'package:contacts_app_kec/Pages/Log%20Screen/SignUpScreen.dart';
import 'package:flutter/material.dart';


class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true ;

  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return LoginScreen(toggleView: toggleView) ;
    }else{
      return SignUpScreen(toggleView: toggleView) ;
    }
  }
}
