import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextSpanDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 10),
            child: Text(
              'tips:类似java的spannable String,长按find the震动',
              style: TextStyle(color: Colors.red),
            ),
          ),
          BuzzingText()
        ],
      ),
    ));
  }
}

class BuzzingText extends StatefulWidget {
  @override
  _BuzzingTextState createState() => _BuzzingTextState();
}

class _BuzzingTextState extends State<BuzzingText> {
  LongPressGestureRecognizer _longPressGestureRecognizer;

  @override
  void initState() {
    super.initState();
    _longPressGestureRecognizer = LongPressGestureRecognizer()
      ..onLongPress = _handlePress;
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
        text: 'Can yout ',
        style: TextStyle(color: Colors.black),
        children: <InlineSpan>[
          TextSpan(
              recognizer: _longPressGestureRecognizer,
              text: 'find the',
              style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.green,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.solid)),
          TextSpan(text: ' secret ?')
        ]));
  }

  void _handlePress() {
    HapticFeedback.vibrate();
  }
}
