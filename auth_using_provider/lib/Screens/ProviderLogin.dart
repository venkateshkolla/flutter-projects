import 'package:auth_using_provider/Screens/ProviderRegistration.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ProviderDashboard.dart';
import '../ProviderHelper/ProviderState.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
class ProviderLogin extends StatefulWidget {
  @override
  _ProviderLoginState createState() => _ProviderLoginState();
}
class _ProviderLoginState extends State<ProviderLogin> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/assets/backgroundUI.png"),
                        fit: BoxFit.cover
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,40 , 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 100,
                        width: 100,
                        child: SvgPicture.asset("images/assets/xing.svg")),
                    SizedBox(height: 10,),
                    "Login".text.color(Colors.white).size(20).make(),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: TextField(
                        controller: email,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: Colors.white
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Colors.blue[400]
                              )
                          ),
                          isDense: true,                      // Added this
                          contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                        ),
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                     SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: TextField(
                        controller: pass,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: Colors.white
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Colors.blue[400]
                              )
                          ),
                          isDense: true,                      // Added this
                          contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                        ),
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                     SizedBox(height: 20,),

                    GestureDetector(onTap: (){
                      Get.to(ForgotPassword());
                    },
                      child: Text("Forgot Password ? Reset Now",style: TextStyle(color: Colors.white),),),
                     SizedBox(height: 10,),
                    GestureDetector(
                        onTap: (){
                          print("Login Clicked Event");
                          _Login(email.text, pass.text, context);
                        },
                        child: "Login".text.white.light.xl.makeCentered().box.white.shadowOutline(outlineColor: Colors.grey).color(Color(0XFFFF0772)).roundedLg.make().w(150).h(40)),
                     SizedBox(height: 20,),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProviderRegistration()));
          },
          child: RichText(text: TextSpan(
            text: 'New User?',
            style: TextStyle(fontSize: 15.0, color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: ' Register Now',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0XFF4321F5)),
              ),
            ],
          )
          ).pLTRB(20, 0, 0, 15),
        )
    );
  }
  void _Login(String email,String password,BuildContext context) async{
    ProviderState _providerState = Provider.of<ProviderState>(context,listen: false);
    try{
      if(await _providerState.SignInUserAccount(email, password)){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProviderDashboard()));
      }
    }catch(e)
    {
      print(e);
    }
  }
}