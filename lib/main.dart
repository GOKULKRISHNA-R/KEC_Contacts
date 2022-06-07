import 'package:contacts_app_kec/Pages/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Services/Auth.dart';
import 'Services/User.dart';
import 'Shared/Design.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.-- chandramuki pass 91375
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserCls?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'KEC',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const Wrapper(),
      ),
    );
  }
}


