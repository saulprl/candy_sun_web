import 'package:shared_preferences/shared_preferences.dart';

class ThemePreference {
  static const prefKey = 'dark-theme';

  setTheme(bool value) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setBool(prefKey, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getBool(prefKey) ?? true;
  }
}
