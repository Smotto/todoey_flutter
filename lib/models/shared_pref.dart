import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPref {
  save(String key, value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  read(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key));
  }

  remove(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  Future<List<String>> readAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var keys = prefs.getKeys();
    List<String> keyList = List<String>();
    for (String key in keys) {
      keyList.add(key);
    }

    return keyList;
  }
}
