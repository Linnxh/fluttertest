import 'package:flutter/material.dart';
import 'package:fluttertest/home/home.dart';

void main() {
  runApp(SampleApp());
}

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      theme: ThemeData(
        primaryColor: const Color(0xFFDB2C1F),
        primaryTextTheme: const TextTheme(
            subtitle1: TextStyle(
                color: Colors.transparent,
                decoration: TextDecoration.none,
                height: 1.5)),
        primaryIconTheme: const IconThemeData(color: Colors.black),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0.0,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 15),

          iconTheme: IconThemeData(color: Colors.black),
        ),
        tabBarTheme: const TabBarTheme(
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Color(0xFFdb2c1f),
            unselectedLabelColor: Colors.black),
        disabledColor: Color(0xFF7f7f7),
        indicatorColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        // debug
      ),
      home: Home(),
    );
  }
}

//
// class MyHomePage extends StatefulWidget{
//   MyHomePage({Key? key,title}) :super (key:key);
// }

// class SampleAppPage extends StatefulWidget {
//   SampleAppPage({Key? key,title}) : super(key: key);
//
//   @override
//   _SampleAppPageState createState() => _SampleAppPageState();
// }

// class _SampleAppPageState extends State<SampleAppPage> {
//   // List<Widget> widgets = [];
//
//   @override
//   void initState() {
//     super.initState();
//     // for (int i = 0; i < 100; i++) {
//     //   widgets.add(getRow(i));
//     // }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sample App'),
//       ),
//       body: Text("body Text")
//     );
//   }
//
//   // Widget getRow(int i) {
//   //   return GestureDetector(
//   //     onTap: () {
//   //       setState(() {
//   //         widgets = List.from(widgets);
//   //         widgets.add(getRow(widgets.length));
//   //         print('row $i');
//   //       });
//   //     },
//   //     child: Padding(
//   //       padding: EdgeInsets.all(10.0),
//   //       child: Text('Row $i'),
//   //     ),
//   //   );
//   // }
// }
