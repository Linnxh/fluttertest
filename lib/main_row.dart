import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo2'),
        ),
        body: Container(
          height: 600.0,
          width: 500.0,
          color: Colors.pink,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 使用较多
            crossAxisAlignment: CrossAxisAlignment.start, // 使用较少
            children: <Widget>[
              HomeContent(
                Icons.home,
                size: 20,
                color: Colors.green,
              ),
              HomeContent(
                Icons.home,
                size: 20,
                color: Colors.green,
              ),
              HomeContent(
                Icons.search,
                size: 20,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class HomeContent extends StatelessWidget {
  double? size = 60.0;
  Color? color = Colors.yellow;
  IconData icon;

  HomeContent(this.icon, {required this.size, required this.color}) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: color,
      child: Center(
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
    );
  }
}
