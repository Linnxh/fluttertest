import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/commonwidgets/Customicons.dart';
import 'package:fluttertest/discovery/widget/CategoryButton.dart';
import 'package:fluttertest/discovery/widget/NewAlbumAndSong.dart';
import 'package:fluttertest/discovery/widget/RecommendPlayList.dart';
import 'package:fluttertest/discovery/widget/DiscoverBanner.dart';

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
        slivers: <Widget>[
          const DiscoverBanner(), // 轮播图
          CategoryButton(), // 分类
          const RecommendPlayListHeader(), // 推荐歌单头部
          RecommendPlayListGrid(), // 推荐歌单列表
          const NewAlbumAndSongHeader(),
          const NewAlbumGrid()
        ],
      ),
    );
  }
}
