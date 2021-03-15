import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ProviderHelper/ProviderState.dart';

class ProviderDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    ProviderState _providerState = Provider.of<ProviderState>(context,listen: false);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("UID: ${_providerState.getUid}"),
            Text("Email : ${_providerState.getEmail}"),
            ElevatedButton(onPressed: (){
             _providerState.signOut();
            },child: Text("Sign Out "),),

          ],
        ),
      ),
    );
  }
}