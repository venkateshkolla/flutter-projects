import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
class ProviderState extends ChangeNotifier{
  String _Uid;
  String _Email;
 String get getUid =>_Uid;
  String get getEmail => _Email;
  FirebaseAuth _auth = FirebaseAuth.instance;


  Future<bool> CreateUserAccount(String email,String password) async{
    bool success = false;
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if(userCredential != null)
        {
          _Uid = userCredential.user.uid;
          _Email = userCredential.user.email;
          return success = true;
        }
    }catch(e)
    {
      print(e);
    }
    return success;
  }



  Future<bool> SignInUserAccount(String email,String password) async{
    bool success = false;
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      if(userCredential != null)
      {
        _Uid = userCredential.user.uid;
        _Email = userCredential.user.email;
        return success = true;
      }
    }catch(e)
    {
      print(e);
    }
    return success;
  }

  void signOut() async{
    await _auth.signOut();
  }
  
}