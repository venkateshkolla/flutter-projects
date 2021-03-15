import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_in_trips/Screens/home.dart';

import '../constans.dart';

import 'login.dart';

class Landingpage extends StatelessWidget {
//initilize firebase first
  final Future<FirebaseApp> _initilization = Firebase.initializeApp();
  @override
  Widget build(BuildContext landingcontext) {
    //it has two properties future,builder
    return FutureBuilder(
      future: _initilization, //initillize firebase

      // builder shorthand syntex   snapshot is data
      builder: (futurebuildercontext, snapshot) {
//if snapshot has error
        if (snapshot.hasError) {
          return Scaffold(
            body: Text("Error:${snapshot.error}"),
          );
        }

//connection initilized firebase is connected
        if (snapshot.connectionState == ConnectionState.done) {
//stream builder can check the login state live
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (streambuildercontext, streamSnapshot) {
//if streamSnapshot has error
              if (streamSnapshot.hasError) {
                return Scaffold(
                  body: Text("Error:${streamSnapshot.error}"),
                );
              }
//connection state active -Do the user login check inside the
//if statement
              if (streamSnapshot.connectionState == ConnectionState.active) {
//get the user
                User _user = streamSnapshot.data;

//if the user is null user has not loggin
                if (_user == null) {
// user not loggin head to loggin
                  return LoginScreen();
                } else {
//user login head to homepage
                  return HomePage();
                }
              }

//checking the auth state to firebase ...loading
              return Scaffold(
                body: Center(
                    child: Text(
                  "checking authentificationn",
                  style: Constants.regularHeading,
                )),
              );
            },
          );
        }

//connected to firebase ...loading
        return Scaffold(
          body: Center(
              child: Text(
            "initilized ...app",
            style: Constants.regularHeading,
          )),
        );
      },
    );
  }
}
