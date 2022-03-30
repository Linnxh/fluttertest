import 'package:flutter/cupertino.dart';

class RecommendPlayList extends StatelessWidget {
  const RecommendPlayList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        child: Container(
          padding: EdgeInsets.fromLTRB(10.0, 16.0, 10.0, 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "推荐歌单",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                child: Container(
                  child: Text('歌单广场', style: TextStyle(fontSize: 12.0)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
