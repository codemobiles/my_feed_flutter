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
      return true;
    }

    return false;
  }
}
