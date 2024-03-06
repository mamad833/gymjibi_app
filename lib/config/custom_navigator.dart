import 'package:flutter/material.dart';

class CustomNavigator {
  static final _navigatorKey = GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  static void pop({dynamic value}) => _navigatorKey.currentState!.pop(value);

  static Future<dynamic> push(Widget page) => _navigatorKey.currentState!
      .push(MaterialPageRoute(builder: (context) => page));

  static Future<dynamic> pushReplacement(Widget page) =>
      _navigatorKey.currentState!
          .pushReplacement(MaterialPageRoute(builder: (context) => page));
}
