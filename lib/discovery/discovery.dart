import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/commonwidgets/Customicons.dart';

class Discovery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CustomIcons.music),
          onPressed: () {},
        ),
        title: Text("发现"),
        centerTitle: true,
      ),

      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[],

      )
      ,

    );
  }
}
