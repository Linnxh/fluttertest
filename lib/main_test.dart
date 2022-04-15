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
        body: Container(child: Text("ssssss"),),
      ),
      routes: {
        '/test': (context) => HomeContent2(),
        '/test2': (context) => HomeContent3(),
      },
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

///
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Text("sssss");
//   }
// }

/// *********************************以上是有状态组件的用法 输入 stful*********************************

/// *********************************以下是无状态组件的用法*********************************

/// listview 列表 item 是card组件
class HomeContent5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          margin: EdgeInsets.all(10),

          ///纵向布局
          child: Column(
            children: <Widget>[
              AspectRatio(
                /// 设置整个平铺的
                aspectRatio: 3.0 / 1.0,

                /// 宽高比
                child: Image.network(
                  "https://image.meipinshu.com/resources/2022/3/31/1648711991380.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://image.meipinshu.com/resources/2022/3/31/1648712100221.jpg"),
                ),
                title: Text("zhangsan"),
                subtitle: Text("engineer"),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  /// 纵向布局
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://image.meipinshu.com/resources/2022/3/31/1648712100221.jpg"),
                      ),
                    ),
                    Row(
                      /// 横向布局
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "tel:",
                          style: TextStyle(color: Colors.pink),
                        ),
                        Container(
                            margin: EdgeInsets.all(10),
                            child: Text("186677767676")),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.all(10),

          /// 纵向布局
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text("zhangsan"),
                subtitle: Text("engineer"),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "tel:",
                      style: TextStyle(color: Colors.pink),
                    ),
                    Container(
                        margin: EdgeInsets.all(10),
                        child: Text("186677767676")),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class HomeContent4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      /// 横向平铺的样式
      aspectRatio: 4.0 / 1.0,
      child: Container(
        color: Colors.green,
      ),
    );
  }
}

/// stack 结合positon
class HomeContent3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        width: 200,
        color: Colors.red,
        child: Stack(
          children: const <Widget>[
            Positioned(

                /// 固定位置
                left: 10,
                child: Icon(
                  Icons.home,
                  size: 40,
                  color: Colors.white,
                )),
            Align(
              /// 相对于父组件的位置
              alignment: Alignment.bottomLeft,
              child: Icon(
                Icons.search,
                size: 30,
                color: Colors.blue,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.send,
                size: 20,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// stack
class HomeContent2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          Container(
            height: 300,
            width: 200,
            color: Colors.red,
          ),
          Text(
            "swoshi",
            style: TextStyle(fontSize: 40.0, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
