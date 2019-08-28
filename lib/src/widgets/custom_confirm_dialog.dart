import 'package:flutter/material.dart';

class CustomConfirmDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onPressOK;
  final VoidCallback onPressCancel;

  const CustomConfirmDialog({
    @required this.title,
    @required this.content,
    this.onPressOK,
    this.onPressCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        FlatButton(
          child: Text("ok"),
          onPressed: onPressOK,
        ),
        FlatButton(
          child: Text("cancel"),
          onPressed: onPressCancel,
        ),
      ],
    );
  }
}
