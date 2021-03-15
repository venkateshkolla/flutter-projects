import 'package:flutter/material.dart';
import 'package:get_in_trips/notifier/ProviderState.dart';
import 'package:get_in_trips/widgets/custom_button1.dart';
import 'package:get_in_trips/widgets/custominput.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _registerFormLoading = false;

//form input field values
  String _registerEmail = "";
  String _registerPassword = "";
  ProviderState providerstate = ProviderState();

//Build an alert dialog to diaplay some errors
  Future<void> _alertDialogBuilder(String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Container(child: Text(error)),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("close dialouge "))
            ],
          );
        });
  }

  void _submitForm(String email, String password) async {
    //set the form to loading state
    setState(() {
      _registerFormLoading = true;
    });

//run the create account method
    String _createAccountFeedBack =
        await providerstate.createaccount(email, password);

    //if string is not null,we got error while create account
    if (_createAccountFeedBack != null) {
      _alertDialogBuilder(_createAccountFeedBack);

//set the form to regular state
      setState(() {
        _registerFormLoading = false;
      });
    } else {
      // the string was null, user is login
      Navigator.of(context).pop(context);
    }
  }

//focus node for input fields

  FocusNode _passwordFocusNode;

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              ClipPath(
                clipper: DrawClip1(),
                child: Container(
                    height: size.height,
                    width: size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).primaryColor.withOpacity(0.5),
                          Theme.of(context).accentColor
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomLeft,
                      ),
                    )),
              ),
              ClipPath(
                clipper: DrawClip(),
                child: Container(
                    height: size.height,
                    width: size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).primaryColor,
                          Theme.of(context).accentColor,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomLeft,
                      ),
                    )),
              ),
              Container(
                  height: size.height,
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40, top: 140),
                        child: Text(
                          "Register",
                          style: GoogleFonts.raleway(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 120, left: 40, right: 50),
                        child: CustomInput(
                          hinttext: "email...",
                          onchanged: (value) {
                            _registerEmail = value;
                          },
                          textInputAction: TextInputAction.next,
                          onsubmitted: (value) {
                            _passwordFocusNode.requestFocus();
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 40, right: 50),
                        //child: input("Password", true),

                        child: CustomInput(
                          hinttext: "password",
                          isPasswordField: true,
                          onchanged: (value) {
                            _registerPassword = value;
                          },
                          onsubmitted: (value) {
                            // _submitForm();
                          },
                          focusNode: _passwordFocusNode,
                        ),
                      ),
                      Center(
                        child: Custom_button1(
                          text: "Register",
                          onpressed: () {
                            _submitForm(_registerEmail, _registerPassword);

                            setState(() {
                              _registerFormLoading = true;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: size.width / 3,
                            right: size.width / 3,
                            top: 30),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                          child: Text(
                        "Already Member ",
                        style: GoogleFonts.raleway(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                          child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                        },
                        child: Text(
                          "SIGNIN",
                          style: GoogleFonts.raleway(
                              fontSize: 18,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w700),
                        ),
                      )),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class DrawClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip

    Path path = Path();
    path.addOval(
        Rect.fromCircle(center: Offset(size.width * 0.3, 50.0), radius: 200));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip

    return true;
  }
}

class DrawClip1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip

    Path path = Path();
    path.addOval(
        Rect.fromCircle(center: Offset(size.width, 50.0), radius: 150));

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip

    return true;
  }
}
