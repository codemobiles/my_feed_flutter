import 'package:flutter/material.dart';
import 'package:my_feed/src/pages/main_page.dart';
import 'package:my_feed/src/pages/login_page.dart';
import 'package:my_feed/src/services/auth_service.dart';
import 'package:my_feed/src/themes/app_theme.dart';
import 'package:my_feed/src/utils/constants.dart';

class MyApp extends StatelessWidget {
  final _route = <String, WidgetBuilder>{
    Constant.LOGIN_ROUTE: (context) => LoginPage(),
    Constant.HOME_ROUTE: (context) => MainPage()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: _route,
      title: Constant.APP_NAME,
      theme: appTheme(),
      home: FutureBuilder<bool>(
        future: AuthService().isLogin(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            if(snapshot.data == true){
              return MainPage();
            }
            return LoginPage();
          }else if(snapshot.hasError){
            // todo
          }
          return LoginPage();
        },
      )
    );
  }
}
