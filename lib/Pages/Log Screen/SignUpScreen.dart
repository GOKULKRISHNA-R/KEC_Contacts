import 'package:contacts_app_kec/Shared/Text_Feild_Container.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../Services/Auth.dart';
import '../../Services/db.dart';
import '../../Shared/Design.dart';
import '../../Shared/loading/Loading.dart';
import '../../Shared/Already_Having_Acc.dart';
import '../../Shared/RoundedButton.dart';


class SignUpScreen extends StatefulWidget {

  final Function toggleView;

  SignUpScreen({ required this.toggleView });


  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  late bool _passwordVisible;
  String filename = 'Select Image' ;

  @override
  void initState() {
    _passwordVisible = false;
  }

  bool loading = false;
  String error = '';
  String email = '';
  String password = '';
  String Dept = 'Select Dept';
  String Desig = '';
  String Name = '';
  String phno = '';
  String url = '';
  bool a = false ;

  final List<String> department = [
    'Select Dept',
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
    UploadTask? task ;

    Size size = MediaQuery
        .of(context)
        .size;

    return loading ? const Loading() : Scaffold(

        body: SizedBox(
          height: size.height,
          width: double.infinity,

          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  "Img/Images/main_top.png",
                  width: size.width * 0.35,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset(
                  "Img/Images/main_bottom.png",
                  width: size.width * 0.25,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  "Img/Images/login_bottom.png",
                  width: size.width * 0.4,
                ),
              ),
              SingleChildScrollView(
                child: Form(

                  key: _formKey,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: size.height * 0.05),
                      const Text(
                        "SIGNUP",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: size.height * 0.03),
                      Image.asset("Img/Images/SignUpImg.jpg",
                        height: size.height * 0.35,),

                      TextFieldContainer(
                          child: TextFormField(
                            cursorColor: kPrimaryColor,
                            decoration: textInputDecoration.copyWith(
                                hintText: "Your Name",
                                icon: const Icon(
                                  Icons.person,
                                  color: kPrimaryColor,
                                )

                            ),

                            validator: (val) =>
                            val!.isEmpty
                                ? 'Enter Name'
                                : null,
                            onChanged: (val) {
                              setState(() {
                                Name = val;
                              });
                            },
                          )
                      ),

                      TextFieldContainer(
                          child: TextFormField(
                            cursorColor: kPrimaryColor,
                            decoration: textInputDecoration.copyWith(
                                hintText: "Your Designation",
                                icon: const Icon(
                                  Icons.person,
                                  color: kPrimaryColor,
                                )

                            ),

                            validator: (val) =>
                            val!.isEmpty
                                ? 'Enter Designation'
                                : null,
                            onChanged: (val) {
                              setState(() {
                                Desig = val;
                              });
                            },
                          )
                      ),
                      TextFieldContainer(
                        child: DropdownButtonFormField<String>(
                          dropdownColor: kPrimaryLightColor,

                          hint: const Text('Select Dept'),
                          onChanged: (val) => setState(() => Dept = val!),
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
                            decoration: textInputDecoration.copyWith(
                                hintText: "Your Phone Number",
                                icon: const Icon(
                                  Icons.person,
                                  color: kPrimaryColor,
                                )

                            ),

                            validator: (val) =>
                            val!.length != 10
                                ? 'Enter Valid Phone Number'
                                : null,
                            onChanged: (val) {
                              setState(() {
                                phno = val;
                              });
                            },
                          )
                      ),

                      TextFieldContainer(
                          child: TextFormField(
                            cursorColor: kPrimaryColor,
                            decoration: textInputDecoration.copyWith(
                                hintText: "Your Email",
                                icon: const Icon(
                                  Icons.email,
                                  color: kPrimaryColor,
                                )

                            ),

                            validator: (val) =>
                            val!.isEmpty
                                ? 'Enter Email Id'
                                : null,
                            onChanged: (val) {
                              setState(() {
                                email = val;
                              });
                            },
                          )
                      ),

                      TextFieldContainer(
                          child: TextFormField(
                            obscureText: true,
                            cursorColor: kPrimaryColor,
                            decoration: textInputDecoration.copyWith(
                              hintText: "Password",
                              icon: const Icon(
                                Icons.lock,
                                color: kPrimaryColor,
                              ),
                            ),
                            validator: (val) =>
                            val!.length < 8
                                ? 'Enter an valid Password above 8 chars'
                                : null,
                            onChanged: (val) {
                              setState(() {
                                password = val;
                              });
                            },
                          )
                      ),

                      TextFieldContainer(
                          child: TextFormField(
                            obscureText: !_passwordVisible,
                            cursorColor: kPrimaryColor,
                            decoration: textInputDecoration.copyWith(
                                hintText: "Confirm Password",
                                icon: const Icon(
                                  Icons.lock,
                                  color: kPrimaryColor,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.visibility,
                                    color: kPrimaryColor,
                                  ),
                                )
                            ),


                            validator: (val) =>
                            val != password
                                ? 'Password does not match '
                                : null,
                            onChanged: (val) {},
                          )
                      ),
                      SizedBox(height: size.height * 0.01),

                      SizedBox(
                        width: size.width * 0.8 ,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(29),
                          child: ElevatedButton(
                            style:  ElevatedButton.styleFrom(
                                primary: kPrimaryLightColor,
                                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                            ),
                            onPressed: () async {
                              final result = await FilePicker.platform
                                  .pickFiles(
                                allowMultiple: false,
                                type: FileType.custom,
                                allowedExtensions: ['png', 'jpg'],
                              );

                              if (result == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    // dismissDirection: D,
                                      content: Text('No file Selected.')),
                                );
                                return;
                              }

                              final path = result.files.first.path;
                              final fileName = result.files.first.name;

                              task = Storage.uploadFile(path!, fileName) ;
                              task?.then((snapshot) async{
                                String imageUrl = await snapshot.ref.getDownloadURL();
                                print(imageUrl);
                              setState(() {
                              filename = 'Done 👍';
                              a = true ;
                              url = imageUrl;
                              });
                              });

                            },

                            child: Text(
                                filename,
                              style: const TextStyle(
                                color: kPrimaryColor, fontSize: 14, fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      RoundedButton(
                        text: "SIGNUP",
                        color: kPrimaryColor,
                        press: () async {
                          if (_formKey.currentState!.validate() && a) {
                            // uploadFile();
                            setState(() {
                              loading = true;
                            });
                            dynamic result = await _auth
                                .registerwithemailandpassword(email, password, Name, phno, Desig, Dept,url);
                            // _db.updateUserData(un, pn);

                            if (result == null) {
                              setState(() {
                                error = 'please enter valid email';
                                loading = false;
                                Navigator.pop(context);
                              });
                            } else {
                              Navigator.pop(context);
                              if (kDebugMode) {
                                print("Yep Done");
                              }
                            }
                          }
                        },
                      ),

                      Text(
                        error,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                        ),
                      ),

                      AlreadyHaveAnAccountCheck(
                        login: false,
                        press: () {
                          widget.toggleView();
                        },
                      ),

                      SizedBox(height: size.height * 0.06),

                    ],
                  ),


                ),
              ),
            ],
          ),
        )

    );
  }

}





















/*
Container(
                              margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
                              width: size.width * 0.8,
                              child: Row(
                                  children: const <Widget>[
                                      Expanded(
                                          child: Divider(
                                          color: Color(0xFFD9D9D9),
                                          height: 1.5,
                                          ),
                                          ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                          child: Text(
                                          "OR",
                                          style: TextStyle(
                                          color: kPrimaryColor,
                                          fontWeight: FontWeight.w600,
                                          ),
                                          ),
                                          ),
                                      // Expanded(
                                      //     child: Divider(
                                      //     color: Color(0xFFD9D9D9),
                                      //     height: 1.5,
                                      //     ),
                                      //     ),
                                  ],
                              ),
                          ),

                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                 GestureDetector(
                                     onTap: () {},
                                     child: Container(
                                          margin: const EdgeInsets.symmetric(horizontal: 10),
                                              padding: const EdgeInsets.all(20),
                                              decoration: BoxDecoration(
                                              border: Border.all(
                                              width: 2,
                                              color: kPrimaryLightColor,
                                              ),
                                              shape: BoxShape.circle,
                                              ),
                                          child: Image.asset(
                                              "Img/Icons/email.png",
                                              height: 20,
                                              width: 20,
                                              ),
                                     ),
                                 ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 10),
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: kPrimaryLightColor,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      "Img/Icons/google.png",
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 10),
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: kPrimaryLightColor,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      "Img/Icons/phone-call.png",
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                ),
                ],
            )
*/


