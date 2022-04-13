import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttertest/commonwidgets/CustomPlayListItem.dart';
import 'package:fluttertest/commonwidgets/CustomSliverGrid.dart';
import 'package:fluttertest/httpRequest.dart';
import 'package:fluttertest/redux/actions.dart';
import 'package:fluttertest/redux/appstate.dart';
import 'package:fluttertest/viewModel/recommendPlayList.dart';
import 'package:redux/redux.dart';

class RecommendPlayListHeader extends StatelessWidget {
  const RecommendPlayListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10.0, 16.0, 10.0, 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "推荐歌单",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                child: Container(
                  child: const Text('歌单广场', style: TextStyle(fontSize: 12.0)),
                  padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
                  decoration: ShapeDecoration(
                      shape: StadiumBorder(
                          side: BorderSide(
                              color: Theme.of(context).dividerColor))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RecommendPlayListGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List>(
      distinct: true,
      converter: (Store store) => store.state.recommendPlayList,
      builder: (BuildContext context, List recommendPlayList) {
        return SliverPadding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 0.0),
          sliver: CustomSliverGrid(
            children: recommendPlayList
                .map((item) => CustomPlayListItem(
                    id: item.id,
                    playCount: item.playCount,
                    name: item.name,
                    picUrl: item.picUrl))
                .toList(),
          ),
        );
      },
      onInit: (Store store) {
        httpRequest
            .get("http://172.16.1.7:8081/music/getRecommendList")
            .then((response) {
          print("getRecommendList==resp====");
          print(response.data["data"]);
          List list = response.data["data"]
              .map((recommend) => recommendPlayList(
                  id: recommend["id"],
                  playCount: recommend["playCount"],
                  name: recommend["name"],
                  picUrl: recommend["picUrl"]))
              .toList();
          print("getRecommendList==list====");
          print(list);
          store.dispatch(SetRecommendPlayListAction(list));
        });
      },
    );
  }
}
