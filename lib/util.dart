import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void showToast(BuildContext context, String s) {
  Toast.show(s, context, duration: Toast.LENGTH_SHORT);
}
