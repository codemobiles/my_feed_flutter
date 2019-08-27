import 'package:flutter/material.dart';
import 'package:my_feed/src/models/user.dart';
import 'package:my_feed/src/services/auth_service.dart';
import 'package:my_feed/src/utils/constants.dart';
import 'package:my_feed/src/widgets/custom_simple_dialog.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  User user;

  var _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    user = User();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          color: Colors.white,
          margin: EdgeInsets.only(left: 30, right: 30),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(22.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  buildHeaderImage(),
                  SizedBox(height: 40),
                  buildUsernameTextFormField(),
                  buildPasswordTextFormField(),
                  buildLoginContainer(),
                  buildForgotSizedBox(),
                  if(false) Text("xxxxxxx")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildForgotSizedBox() {
    return SizedBox(
      width: double.infinity,
      child: FlatButton(
        splashColor: Colors.blue,
        child: Text("Forgot password?"),
        onPressed: () {
          //todo
        },
      ),
    );
  }

  Container buildLoginContainer() {
    return Container(
      margin: EdgeInsets.only(top: 32),
      width: double.infinity,
      child: RaisedButton(
        color: Constant.PRIMARY_COLOR,
        splashColor: Colors.orange,
        child: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () async {
          _formKey.currentState.save();

          final result = await AuthService().login(user);
          if (result) {
            Navigator.pushReplacementNamed(context, Constant.HOME_ROUTE);
          } else {
            showAlertDialog(title: "title", content: "login failure");
          }
        },
      ),
    );
  }

  Image buildHeaderImage() => Image.asset(Constant.HEADER_LOGIN_IMAGE);

  TextFormField buildPasswordTextFormField() {
    return TextFormField(
      onSaved: (String value) {
        user.password = value;
      },
      obscureText: true,
      decoration: InputDecoration(
//                  hintStyle: TextStyle(color: Colors.red),
//                  labelStyle: TextStyle(color: Colors.red),
          icon: Icon(
            Icons.lock,
            // color: Colors.red,
          ),
          labelText: "Password"),
    );
  }

  TextFormField buildUsernameTextFormField() {
    return TextFormField(
      onSaved: (String value) {
        user.username = value;
      },
      decoration: InputDecoration(
//                  hintStyle: TextStyle(color: Colors.red),
//                  labelStyle: TextStyle(color: Colors.red),
          icon: Icon(
            Icons.person,
            // color: Colors.red,
          ),
          hintText: "example@gmail.com",
          labelText: "Email"),
    );
  }

  void showAlertDialog({String title, String content}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CustomSimpleDialog(
          title: title,
          content: content,
          onPress: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
