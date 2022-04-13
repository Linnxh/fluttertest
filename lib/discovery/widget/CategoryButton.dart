import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/commonwidgets/CustomIconButton.dart';
import 'package:fluttertest/commonwidgets/Customicons.dart';

// 分类图标
class CategoryButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Container(
      padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Theme.of(context).dividerColor, width: 0.5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CustomIconButton(
            icon: Icons.date_range,
            text: "每日推荐",
            onTap: () {},
          ),
          CustomIconButton(
            icon: Icons.list,
            text: "歌单",
            onTap: () {},
          ),
          CustomIconButton(
            icon: CustomIcons.music,
            text: "排行榜",
            onTap: () {},
          ),
          CustomIconButton(
            icon: Icons.date_range,
            text: "电台",
            onTap: () {},
          ),
          CustomIconButton(
            icon: Icons.date_range,
            text: "直播",
            onTap: () {},
          ),
        ],
      ),
    ));
  }
}

// CustomIconButton(icon: Icons.date_range, text: "每日推荐")
