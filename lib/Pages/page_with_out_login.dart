import 'package:contacts_app_kec/Pages/Home/Background.dart';
import 'package:contacts_app_kec/Pages/Home/UserList.dart';
import 'package:contacts_app_kec/Pages/Log%20Screen/Authenticate.dart';
import 'package:contacts_app_kec/Services/User.dart';
import 'package:contacts_app_kec/Services/db.dart';
import 'package:contacts_app_kec/Shared/Design.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Shared/Text_Feild_Container.dart';

class HomeWithoutLogin extends StatefulWidget {
  const HomeWithoutLogin({Key? key}) : super(key: key);

  @override
  State<HomeWithoutLogin> createState() => _HomeWithoutLoginState();
}

class _HomeWithoutLoginState extends State<HomeWithoutLogin> {

  String str = '' ;
  String dept = 'ALL DEPT' ;

  String pstr = '' ;
  String pDept = 'ALL DEPT' ;

  final List<String> department = [

    'ALL DEPT',
    'CSE',
    'ECE',
    'CSD',
    'IT',
    'EEE',
    'EIE',
    'CIVIL',
    'MTR',
    'AUTO',
    'MECH',
    'BNYS',
    'MBA',
    'MSC',
    'BSC',
    'CHEM',
    'MATHS',
    'PHY',
    'ENG'
  ];

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery
        .of(context)
        .size;

    return StreamProvider<List<UserData>>.value(

      value: DBService(uid: '').user,

      catchError: (_, err){
        if (kDebugMode) {
          print('===>>>$err');
        }
        return [
          UserData(
              username: '######',
              phonenumber: '######',
              email: '######',
              designation: '######',
              dept: '######',
              imgurl: '######'
          )
        ].toList();
      },


      initialData: [
        UserData(
          username: 'Loading...',
          phonenumber: 'Loading...',
          email: 'Loading...',
          designation: 'Loading...',
          dept: 'Loading...',
          imgurl: 'Loading...',
        )
      ].toList(),

      /**/

      child: Scaffold(

        body: Background(
            child:
            Userlist(mystr: str, dept: dept,)
        ),


        backgroundColor: kPrimaryLightColor,

        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: const Text(
            'Welcome',
            style: TextStyle(
              color: kPrimaryColor,
            ),
          ),
          actions: [

            IconButton(
              icon:const Icon(
                Icons.search_rounded,
                color: kPrimaryColor,
              ),
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                        title: const Text('Search'),
                        content:  Column(
                          crossAxisAlignment:  CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: size.height * 0.05),

                            TextFieldContainer(
                              child: DropdownButtonFormField<String>(
                                dropdownColor: kPrimaryLightColor,

                                hint: Text(dept),
                                onChanged: (val) => setState(() => dept = val!),
                                decoration: textInputDecoration.copyWith(
                                    prefixIcon: const Icon(
                                      Icons.person,
                                      color: kPrimaryColor,
                                    )
                                ),
                                items: department.map((e) => DropdownMenuItem<String>(
                                    value: e, child: Text(e))).toList(),
                              ),
                            ),

                            TextFieldContainer(
                              child: TextFormField(
                                cursorColor: kPrimaryColor,
                                initialValue: str,
                                decoration: textInputDecoration.copyWith(
                                    hintText: 'Search',
                                    prefixIcon: const Icon(
                                      Icons.search_rounded,
                                      color: kPrimaryColor,
                                    )
                                ),
                                onChanged: (val) => setState(() => str = val ),
                              ),
                            ),

                          ],
                        )
                    )
                );

              },

            ),

            IconButton(
              icon:const Icon(
                Icons.login,
                color: kPrimaryColor,
              ),
              tooltip:'Log In',
              onPressed: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  const Authenticate()),
                  );
              },
            ),
          ],
        ),
      ),

    );
  }
}

/*
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
*/