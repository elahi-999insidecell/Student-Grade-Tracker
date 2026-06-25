// ignore_for_file: non_constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class Sharedpref {
  bool isDark = false;
  static Future<void> saveThema(bool isDark) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool("thema", isDark);
  }

  static Future<bool> getThema() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool("thema") ?? false;
  }

}

