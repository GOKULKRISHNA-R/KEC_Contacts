import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'User.dart';
import 'db.dart';


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserCls? _userCls(User? user) {
    return user != null ? UserCls(uid: user.uid) : null ;

  }

  Stream<UserCls?> get user {
    return _auth.authStateChanges()
        .map(_userCls);
  }

  Future registerwithemailandpassword(String email , String password , String name , String ph , String des , String dept , String imgurl) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user ;
      await DBService(uid : user!.uid ).updateUserData(name,ph,email,des,dept,imgurl);
      return _userCls(user);
    }catch (e){
      if (kDebugMode) {
        print("=++>$e");
        print("=++>$user ");
      }
      return null ;
    }
  }


  Future signinwithemailandpassword(String email , String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user ;
      return _userCls(user);
    }catch (e){
      if (kDebugMode) {
        print(e.toString());
      }
      return null ;
    }
  }


  Future signOut() async {
    try{
      return await _auth.signOut() ;
    }catch(e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

}