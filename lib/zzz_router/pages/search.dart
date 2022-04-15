import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  var arguments;

  SearchPage({this.arguments, Key? key}) : super(key: key);

//
//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }
//
// class _SearchPageState extends State<SearchPage> {
//   var arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('search title'),
      ),
      body: Text('content${this.arguments != null ? arguments['id'] : '0'}'),
    );
  }
}
