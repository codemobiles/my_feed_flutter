import 'package:my_feed/src/models/user.dart';
import 'package:my_feed/src/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<bool> login(User user) async {
    final username = user.username;
    final password = user.password;

    if (username == "cm@gmail.com" && password == "1234") {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(Constant.USERNAME_PREF, username);
      await prefs.setBool(Constant.IS_LOGIN_PREF, true);
      return true;
    }

    return false;
  }

  Future<bool> isLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(Constant.IS_LOGIN_PREF) ?? false;
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(Constant.IS_LOGIN_PREF);
  }
}
