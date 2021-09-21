import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static void push(BuildContext context, Widget widget) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return widget;
    }));
  }

  static void pushReplacement(BuildContext context, Widget widget) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
      return widget;
    }));
  }
}
