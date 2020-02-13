import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

class Hyperlink extends StatelessWidget {
  final String homepage;

  Hyperlink(
    this.homepage,
  );

  Widget build(BuildContext context) {
    return RichText(
      text: new TextSpan(
        children: [
          new TextSpan(
            text: homepage,
            style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline,),
            recognizer: TapGestureRecognizer()
              ..onTap = () { launch(homepage);
            },
          ),
        ],
      ),
    );
  }
}