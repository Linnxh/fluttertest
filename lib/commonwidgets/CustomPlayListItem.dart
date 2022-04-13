import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/commonwidgets/Customicons.dart';
import 'package:fluttertest/utils/handleCount.dart';

class CustomPlayListItem extends StatelessWidget {
  int id;
  num playCount;
  String name;
  String picUrl;

  // 构造方法
  CustomPlayListItem({
    Key? key,
    required this.id,
    required this.playCount,
    required this.name,
    required this.picUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(3.0),
                  child: FadeInImage.assetNetwork(
                    fit: BoxFit.cover,
                    image: picUrl,
                    placeholder: 'images/default.png',
                  ),
                ),
                Positioned(
                    top: 2.0,
                    right: 4.0,
                    child: Row(
                      children: <Widget>[
                        Icon(CustomIcons.record,
                            size: 14.0, color: Colors.white),
                        Text(
                          calculationCount(playCount),
                          style: TextStyle(color: Colors.white, fontSize: 12.0),
                        )
                      ],
                    )),
              ],
            ),
            Expanded(
                child: Text(name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12.0))),
          ],
        ),
      ),
    );
  }
}
