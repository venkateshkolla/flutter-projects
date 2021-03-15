import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class Custom_button1 extends StatelessWidget {
  final String text;
  final Function onpressed;
  final bool outlinebutton;
  final bool isloaded;

  Custom_button1(
      {this.text, this.onpressed, this.outlinebutton, this.isloaded});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    bool _outlinebutton = outlinebutton ?? false;
    // ignore: unused_local_variable
    bool _isloaded = isloaded ?? false;

    return Center(
      child: GestureDetector(
        onTap: onpressed,
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: TextButton(
            onPressed: null,
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).primaryColor.withOpacity(0.8)
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: Theme.of(context).buttonColor.withOpacity(0.5),
                        width: 2)),
                height: 40,
                child: Center(
                  child: Text(
                    text ?? "text",
                    style: GoogleFonts.raleway(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
