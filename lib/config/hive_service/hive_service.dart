import 'dart:io';

import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

class HiveServices {
  static late Box _myBox;


  static const String _myBoxKey = "myBoxKey";

  static const String _tokenKey = "tokenUser";


  // static const String _saveTimeKey = "tokenUser";

  static Future<void> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(directory.path);
    _myBox = await Hive.openBox(_myBoxKey);

  }

  static void addToken(String token) {
    _myBox.put(_tokenKey, token);
  }

  static String? get getToken {
    return _myBox.get(_tokenKey);
  }

  static void clear() {
    _myBox.clear();
  }

}

