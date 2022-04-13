import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttertest/redux/actions.dart';
import 'package:fluttertest/redux/appstate.dart';
import 'package:redux/redux.dart';

import '../../commonwidgets/CustomSliverGrid.dart';
import '../../httpRequest.dart';
import '../../viewModel/albumItem.dart';

class NewAlbumAndSongHeader extends StatelessWidget {
  const NewAlbumAndSongHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  StoreConnector<AppState, bool>(
                    distinct: true,
                    converter: (Store store) => store.state.showNewSong,
                    builder: (BuildContext context, bool showNewSong) {
                      return GestureDetector(
                        onTap: () {},
                        child: Text(
                          '新碟',
                          style: TextStyle(
                              fontSize: showNewSong ? 14.0 : 16.0,
                              color: showNewSong ? Colors.grey : Colors.black),
                        ),
                      );
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0, right: 10.0),
                    width: 2.0,
                    child: Text(
                      '|',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  StoreConnector<AppState, bool>(
                    distinct: true,
                    converter: (Store store) => store.state.showNewSong,
                    builder: (BuildContext context, bool showNewSong) {
                      return GestureDetector(
                        onTap: () {},
                        child: Text(
                          '新歌',
                          style: TextStyle(
                              fontSize: showNewSong ? 16.0 : 14.0,
                              color: showNewSong ? Colors.black : Colors.grey),
                        ),
                      );
                    },
                  ),
                ],
              ),
              StoreConnector<AppState, bool>(
                  builder: (BuildContext context, bool showNewSong) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
                          decoration: ShapeDecoration(
                              shape: StadiumBorder(
                                  side: BorderSide(
                                      color: Theme.of(context).dividerColor))),
                          child: Text(
                            showNewSong ? "新歌推荐" : "更多新碟",
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  converter: (Store store) => store.state.showNewSong)
            ]),
      ),
    );
  }
}

class NewAlbumGrid extends StatelessWidget {
  const NewAlbumGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List>(
      distinct: true,
      converter: (Store store) => store.state.newAlbum,
      builder: (BuildContext context, List newAlbum) {
        return SliverPadding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 0.0),
          sliver: CustomSliverGrid(
            children: newAlbum
                .map((item) => Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(3.0),
                            child: FadeInImage.assetNetwork(
                              placeholder: 'images/default.png',
                              image: item.picUrl,
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    ))
                .toList(),
          ),
        );
      },
      onInit: (Store store) {
        httpRequest
            .get("http://172.16.1.7:8081/music/getAlbumList")
            .then((response) {
          print("getAlbumList==resp====");
          print(response.data["data"]);
          List list = response.data["data"]
              .map((item) => AlbumItem(
                  id: item["id"],
                  name: item["name"],
                  picUrl: item["picUrl"],artists: []


          ))
              .toList();
          print("getAlbumList==list====");
          print(list);
          store.dispatch(SetNewAlbumAction(list));
        });
      },
    );
  }
}
