import 'package:flutter/material.dart';

class PaddingText extends StatelessWidget {
  final Text text;
  final EdgeInsetsGeometry padding;

  const PaddingText({Key key, this.text, this.padding}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      child: text,
      padding: padding,
    );
  }
}
