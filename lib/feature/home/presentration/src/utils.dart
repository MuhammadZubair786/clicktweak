import 'package:shared_preferences/shared_preferences.dart';

class ClickDs {
  static SharedPreferences? _preferences;

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static void setBoolDialog(bool val) async {
    _preferences?.setBool('seen', val);
  }

  static bool getBool() {
    var seen = _preferences?.getBool('seen');
    return seen ?? false;
  }
}
