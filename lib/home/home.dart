import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/account/account.dart';
import 'package:fluttertest/commonwidgets/Customicons.dart';

import '../discovery/discovery.dart';
import '../friends/Friends.dart';
import '../mine/mine.dart';
import '../video/video.dart';

class Home extends StatelessWidget {
  final List _tabs = [
    {'icon': CustomIcons.music, 'text': '发现'},
    {'icon': CustomIcons.record, 'text': '视频'},
    {'icon': CustomIcons.mine, 'text': '我的'},
    {'icon': CustomIcons.mine, 'text': '朋友'},
    {'icon': CustomIcons.menu, 'text': '账号'}
  ];
  final List<Widget> _pages = [
    Discovery(),
    Video(),
    Mine(),
    Friends(),
    Account()
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: Theme.of(context).primaryColor,
        items: _tabs
            .map((tab) => BottomNavigationBarItem(
                icon: Icon(tab['icon']), label: tab['text']))
            .toList(),
      ),
      tabBuilder: (BuildContext context, int index) {
        return _pages[index];
      },
    );
  }
}
