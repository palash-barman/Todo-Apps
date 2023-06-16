import 'package:shared_preferences/shared_preferences.dart';

class MyPreference {
  static SharedPreferences? sharedPreferences;

  static Future<void> setOnBoard(bool isOnboard) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences!.setBool(Constance.isOnboard, isOnboard);
  }

  static Future<bool> getOnBoard() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences!.getBool(Constance.isOnboard) ?? false;
  }
}

class Constance {
  static String isOnboard = "isOnBoard";
}
