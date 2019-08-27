import 'package:flutter/material.dart';
import 'package:my_feed/src/pages/main_page.dart';
import 'package:my_feed/src/pages/my_home_page.dart';
import 'package:my_feed/src/themes/app_theme.dart';
import 'package:my_feed/src/utils/constants.dart';

class MyApp extends StatelessWidget {
  var _route = <String, WidgetBuilder>{
    Constant.LOGIN_ROUTE: (context) => MyHomePage(),
    Constant.HOME_ROUTE: (context) => MainPage()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: _route,
      title: Constant.APP_NAME,
      theme: appTheme(),
      home: MyHomePage(),
    );
  }
}
