import 'package:auth_using_provider/ProviderHelper/ProviderState.dart';
import 'package:auth_using_provider/Screens/ProviderLogin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';




void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

runApp(
  MultiProvider(providers: [
    
    ChangeNotifierProvider<ChangeNotifier>(
    create: (context) => ProviderState(),
  )
  
  
  ],
  
  child: MyProviderApp(),)
);
}

class MyProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProviderLogin(),
      
    );
  }
}

 



