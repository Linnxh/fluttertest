import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Form2Page extends StatelessWidget {
  /// 设置默认的title
  Form2Page({this.title = 'form2', this.message = 'messs', Key? key})
      : super(key: key);
  String title;
  String message;

  @override
  Widget build(BuildContext context) {
    // var args = ModalRoute.of(context)!.settings.arguments as FormArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("form2"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("接收前面传的值" + title + "=======" + message),
          ),
        ],
      ),
    );
  }
}

class FormArguments2 {
  final String title;
  final String message;
  FormArguments2(this.title, this.message);
}


