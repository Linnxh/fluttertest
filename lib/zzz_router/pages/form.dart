import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  /// 设置默认的title
  FormPage( {Key? key}) : super(key: key);
  // String title;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as FormArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("form"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("接收前面传的值" + args.title + "=======" + args.message),
          ),
          ListTile(
            title: Text("我是表单内容1"),
          ),
          ListTile(
            title: Text("我是表单内容2"),
          ),
          ListTile(
            title: Text("我是表单内容3"),
          ),
        ],
      ),
    );
  }
}

class FormArguments {
  final String title;
  final String message;
  FormArguments(this.title, this.message);
}

// class FormPage extends StatefulWidget {
//   FormPage(this.title, {Key? key}) : super(key: key);
//   String title = 'form title';
//
//   @override
//   State<FormPage> createState() => _FormPageState(title);
// }
//
// class _FormPageState extends State<FormPage> {
//   _FormPageState(String title111);
// String title11111 = title111;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:this.title,
//       ),
//       body: ListView(
//         children: <Widget>[
//           ListTile(
//             title: Text("我是表单内容1"),
//           ),
//           ListTile(
//             title: Text("我是表单内容2"),
//           ),
//           ListTile(
//             title: Text("我是表单内容3"),
//           ),
//         ],
//       ),
//     );
//   }
// }
