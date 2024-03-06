import 'package:flutter/foundation.dart';
// import '../utils/custom_navigator.dart';
import '../custom_navigator.dart';
import 'retry.dart';

class GEasyHelper {
  /// User
  // static UserInfo? userInfo;

  static const String appVersion = "1.0.0";

  /// Middleware Server
  static String errorNetwork =
      "Error establishing server Please check your internet";
  static String serverError = "Server is fail";
  static List<Function> retries = [];
  static bool timeOut = false;

  static bool check(int? statusCode) =>
      statusCode != null && statusCode >= 200 && statusCode < 300;

  static bool _pushed = true;

  static void retry(
      String message,
      VoidCallback retry, {
        bool backAccess = false,
      }) {
    if (message.contains(GEasyHelper.errorNetwork)) {
      retries.add(retry);
      if (_pushed) {
        _pushed = false;
        CustomNavigator.push(RetryPage(backAccess: backAccess))
            .then((value) => _pushed = true);
      }
    } else if (backAccess) {
      retries.add(retry);
      if (_pushed) {
        _pushed = false;
        CustomNavigator.push(RetryPage(backAccess: backAccess))
            .then((value) => _pushed = true);
      }
    }
  }
}
