import 'package:flutter/material.dart';
import 'package:my_feed/src/pages/my_home_page.dart';
import 'package:my_feed/src/themes/app_theme.dart';
import 'package:my_feed/src/utils/constants.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constant.APP_NAME,
      theme: appTheme(),
      home: MyHomePage(),
    );
  }
}
