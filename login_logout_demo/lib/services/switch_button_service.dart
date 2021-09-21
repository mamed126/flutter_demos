import 'package:login_logout_demo/contracts/switcher_contract.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SwitchButtonServices extends ISwitchButton {
  @override
  Future<bool> getK(String key) async {
    final prefs = await SharedPreferences.getInstance();
    bool isDark = prefs.getBool(key) ?? false;
    return isDark;
  }

  @override
  Future delete(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  @override
  Future put(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }
}
