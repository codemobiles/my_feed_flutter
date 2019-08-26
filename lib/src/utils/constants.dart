import 'dart:math';

import 'package:flutter/material.dart';

class Constant {
  // shared preferences
  static const String IS_LOGIN_PREF = "is_login";
  static const String USERNAME_PREF = "username";

  //routes
  static const String HOME_ROUTE = "/home";
  static const String LOGIN_ROUTE = "/login";
  static const String DETAIL_ROUTE = "/youtube detail";

  //strings
  static const String APP_NAME = "CM Flutter";

  //fonts
  static const String QUICK_SAND_FONT = "Quicksand";
  static const String KANIT_FONT = "Kanit";

  //images
  static const String IMAGE_DIR = "assets/images";
  static const String HEADER_HOME_IMAGE = "$IMAGE_DIR/header_home.png";
  static const String HEADER_LOGIN_IMAGE = "$IMAGE_DIR/header_login.png";

  //color
  static const Color PRIMARY_COLOR = Color(0xFF01579B);

  //random color
  static final Random _random = Random();

  // Returns a random color.
  static Color next() {
    return Color(0xFF000000 + _random.nextInt(0x00FFFFFF));
  }
}
