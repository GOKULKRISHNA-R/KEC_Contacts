import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../Services/Auth.dart';
import '../../Shared/RoundedButton.dart';
import '../../Shared/Already_Having_Acc.dart';
import '../../Shared/Design.dart';
import '../../Shared/Text_Feild_Container.dart';
import '../../Shared/loading/Loading.dart';

class LoginScreen extends StatefulWidget {

  final Function toggleView;

  LoginScreen({ required this.toggleView });


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late bool _passwordVisible ;

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false ;
  String error = '' ;
  String email = '' ;
  String password = '' ;

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return loading ? const Loading() : Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "Img/Images/signup_top.png",
                width: size.width * 0.35,
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
                      "LOGIN",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Image.asset("Img/Images/SignInImg.png",height: size.height * 0.35,),
                    SizedBox(height: size.height * 0.03),

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

                          validator: (val) => val!.isEmpty ? 'Enter an valid Email' : null  ,
                          onChanged: (val) {
                            setState(() {
                              email = val ;
                            });
                          },
                        )
                    ),

                    TextFieldContainer(
                        child: TextFormField(
                          cursorColor: kPrimaryColor,
                          obscureText: !_passwordVisible,
                          decoration: textInputDecoration.copyWith(
                            hintText: "Password",
                            icon: const Icon(
                              Icons.lock,
                              color: kPrimaryColor,
                            ),
                            suffixIcon: IconButton(

                              onPressed: () {
                                    setState(() {
                                  _passwordVisible = !_passwordVisible;
                                }); },

                              icon: const Icon(Icons.visibility),
                              color: kPrimaryColor,
                            ),
                          ),
                          validator: (val) => val!.length < 8 ? 'Enter an valid Password above 8 chars' : null ,
                          onChanged: (val) {
                            setState(() {
                              password = val ;
                            });
                          },
                        )
                    ),

                    RoundedButton(
                      text: "LOGIN",
                      color: kPrimaryColor,
                      press: ()  async {
                        if(_formKey.currentState!.validate()){

                              setState(() {
                                  loading = true ;
                              });
                              dynamic result = await _auth.signinwithemailandpassword(email, password);

                              if(result == null)
                              {

                                   setState(() {
                                     error = 'could not sign in with your credentials' ;
                                      loading = false ;
                                      Navigator.pop(context);
                                   });

                              }else{
                                Navigator.pop(context);
                                if (kDebugMode) {
                                  print("Yep Done");
                                print("<>->>6");

                                }
                              }
                        }
                      }
                    ),
                    SizedBox(height: size.height * 0.03),

                    Text(
                      error,
                      style: const TextStyle(
                        color: Colors.red ,
                        fontSize: 14 ,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),

                    AlreadyHaveAnAccountCheck(
                      press: () {
                        widget.toggleView();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
