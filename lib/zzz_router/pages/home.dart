import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/zzz_router/pages/search.dart';

import 'form.dart';
import 'form2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed("/form", arguments: FormArguments('222111', '22222'));
            },
            child: Text("命名路由-跳转到form,并传参数"),
          ),
          // sdfsdkfjsdlfjsdl
          ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed("/form2", arguments: FormArguments2('222111', '22222'));
            },
            child: Text("命名路由(onGenerateRoute)-跳转到form,并传参数"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/search");
            },
            child: Text("命名路由-跳转到搜索"),
          ),
          Container(
            height: 50.0,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SearchPage()));
            },
            child: Text("基本路由-跳转到搜索"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Form2Page(
                        title: "form_test",
                      )));
            },
            child: Text("基本路由-跳转到form2并且传值"),
          )
        ],
      ),
    );
  }
}
