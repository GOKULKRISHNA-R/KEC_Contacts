import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_app_kec/Pages/Home/Background.dart';
import 'package:contacts_app_kec/Pages/Home/SettingForm.dart';
import 'package:contacts_app_kec/Pages/Home/UserList.dart';
import 'package:contacts_app_kec/Services/User.dart';
import 'package:contacts_app_kec/Services/db.dart';
import 'package:contacts_app_kec/Shared/Design.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Services/Auth.dart';
import '../../Shared/Text_Feild_Container.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<DocumentSnapshot<Map<String, dynamic>>> userCollection = FirebaseFirestore.instance.collection('Staff').doc(FirebaseAuth.instance.currentUser?.uid).get();


  String str = '' ;
  String dept = 'ALL DEPT' ;

  final List<String> department = [

    'ALL DEPT',
    'CSE',
    'CSD',
    'ECE',
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

  final AuthService _auth = AuthService();

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

      child: Scaffold(

        body: Background(
            child:
                Userlist(mystr: str, dept: dept,)
        ),

        backgroundColor: kPrimaryLightColor,

        appBar: AppBar(


          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Image.asset('Img/Images/kec1.png',width: 40,height: 40,),
          actions: [

            IconButton(
              icon:const Icon(
                Icons.search_rounded,
                color: kPrimaryColor,
              ),
              onPressed: () async {
                print(userCollection);
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
                Icons.edit,
                color: kPrimaryColor,
              ),
              onPressed: () async {
                showModalBottomSheet(
                    backgroundColor: kPrimaryLightColor,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        )
                    ),
                    context: context,
                    builder: (context) {
                        return const SettingsForm();
                    }
                );
              },

            ),

            IconButton(
              icon:const Icon(
                Icons.logout,
                color: kPrimaryColor,
              ),
              onPressed: () async {
                await _auth.signOut();
              },

            ),
          ],
        ),
      ),

    );
  }
}


/*
              //   showModalBottomSheet(
              //       backgroundColor: kPrimaryLightColor,
              //       isScrollControlled: true,
              //       shape: const RoundedRectangleBorder(
              //           borderRadius: BorderRadius.vertical(
              //             top: Radius.circular(20),
              //           )
              //       ),
              //       context: context,
              //       builder: (context) {
              //         return Container(
              //           padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 60),
              //           child:  Column(
              //
              //             crossAxisAlignment:  CrossAxisAlignment.center,
              //             children: [
              //               SizedBox(height: size.height * 0.05),
              //
              //               TextFieldContainer(
              //                 child: DropdownButtonFormField<String>(
              //                   dropdownColor: kPrimaryLightColor,
              //
              //                   hint: Text(Dept),
              //                   onChanged: (val) => setState(() => Dept = val!),
              //                   decoration: textInputDecoration.copyWith(
              //                       prefixIcon: const Icon(
              //                         Icons.person,
              //                         color: kPrimaryColor,
              //                       )
              //                   ),
              //                   items: department.map((e) => DropdownMenuItem<String>(
              //                       value: e, child: Text(e))).toList(),
              //                 ),
              //               ),
              //
              //               TextFormField(
              //                 cursorColor: kPrimaryColor,
              //                 initialValue: str,
              //                 decoration: textInputDecoration.copyWith(
              //                     hintText: 'Search',
              //                     prefixIcon: const Icon(
              //                       Icons.search_rounded,
              //                       color: kPrimaryColor,
              //                     )
              //                 ),
              //                 onChanged: (val) => setState(() => str = val ),
              //               ),
              //             ],
              //           ),
              //         );
              //       }
              //   );
*/
