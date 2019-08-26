import 'package:flutter/material.dart';
import 'package:my_feed/src/utils/constants.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        color: Colors.white,
        margin: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: <Widget>[
            Image.asset(Constant.HEADER_LOGIN_IMAGE),
            SizedBox(height: 40),
            TextField(
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.red),
                  labelStyle: TextStyle(color: Colors.red),
                  icon: Icon(
                    Icons.person,
                    color: Colors.red,
                  ),
                  hintText: "example@gmail.com",
                  labelText: "Email"),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.red),
                  labelStyle: TextStyle(color: Colors.red),
                  icon: Icon(
                    Icons.lock,
                    color: Colors.red,
                  ),
                  labelText: "Password"),
            )
          ],
        ),
      ),
    );
  }
}

