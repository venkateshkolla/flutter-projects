import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constans.dart';


class CustomInput extends StatelessWidget {
  final String hinttext;
  final Function(String) onchanged;
  final Function(String) onsubmitted;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final bool isPasswordField;

  CustomInput(
      {this.hinttext,
      this.onchanged,
      this.onsubmitted,
      this.focusNode,
      this.textInputAction,
      this.isPasswordField});
  @override
  Widget build(BuildContext context) {
    bool _ispasswordField = isPasswordField ?? false;
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
            hintText: hinttext ?? "Hint Text...",
            hintStyle: GoogleFonts.raleway(color: Colors.grey),
            contentPadding: EdgeInsets.only(top: 15, bottom: 15),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300], width: 2.0),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0x4ff6ddbf), width: 1.0))),
         onFieldSubmitted: onsubmitted,       
        focusNode: focusNode,
        onChanged: onchanged,
        textInputAction: textInputAction,
        obscureText: _ispasswordField,
        style: Constants.regularDarktext,
      ),
    );
  }
}
