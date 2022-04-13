import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttertest/httpRequest.dart';
import 'package:fluttertest/redux/actions.dart';
import 'package:fluttertest/viewModel/bannerItem.dart';
import 'package:redux/redux.dart';

import '../../redux/appstate.dart';

class DiscoverBanner extends StatefulWidget {
  const DiscoverBanner({Key? key}) : super(key: key);

  @override
  State<DiscoverBanner> createState() => _BannerState();
}

class _BannerState extends State<DiscoverBanner> {
  PageController _pageController = PageController(initialPage: 1);
  int _currentIndex = 1;

  late Timer _timer;

  List _banners = [];

  List addBanners = [];

  @override
  void initState() {
    super.initState();
  }

  // 设置定时器
  _setTimer() {
    _timer = Timer.periodic(Duration(seconds: 4), (_) {
      _pageController.animateToPage(_currentIndex + 1,
          duration: Duration(milliseconds: 400), curve: Curves.easeOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 2.5,
        child: StoreConnector<AppState, List>(
          distinct: true,
          converter: (Store store) => store.state.banners,
          builder: (BuildContext context, List banner) {
            if (banner.length > 0) {
              List addBanners = [];
              addBanners
                ..add(banner[banner.length - 1])
                ..addAll(banner)
                ..add(banner[0]);

              return Stack(
                children: <Widget>[
                  NotificationListener(
                    onNotification: (ScrollNotification notification) {
                      if (notification.depth == 0 &&
                          notification is ScrollStartNotification) {
                        if (notification.dragDetails != null) {
                          _timer.cancel();
                        }
                      } else if (notification is ScrollEndNotification) {
                        _timer.cancel();
                        _setTimer();
                      }
                      return true;
                    },
                    child: PageView(
                      physics: const BouncingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (page) {
                        print(page);
                        int newIndex;

                        if (page == addBanners.length - 1) {
                          newIndex = 1;
                          _pageController.jumpToPage(newIndex);
                        } else if (page == 0) {
                          newIndex = addBanners.length - 2;
                          _pageController.jumpToPage(newIndex);
                        } else {
                          newIndex = page;
                        }
                        setState(() {
                          _currentIndex = newIndex;
                        });
                      },
                      children: addBanners
                          .map((e) => Container(
                                margin: const EdgeInsets.all(10.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Image.network(e.imgUrl,
                                      fit: BoxFit.cover),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  Positioned(
                    bottom: 15.0,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: banner
                          .asMap()
                          .map((i, v) => MapEntry(
                              i,
                              Container(
                                width: 6.0,
                                height: 6.0,
                                margin: const EdgeInsets.only(
                                    left: 2.0, right: 2.0),
                                decoration: BoxDecoration(
                                    color: _currentIndex == i + 1
                                        ? Theme.of(context).primaryColor
                                        : Colors.white,
                                    shape: BoxShape.circle),
                              )))
                          .values
                          .toList(),
                    ),
                  )
                ],
              );
            } else {
              return Container();
            }
          },
          onInit: (Store store) {
            httpRequest
                .get("http://172.16.1.7:8081/music/getBannerImgList")
                .then((response) {
              print(response.data["data"]);
              List bannerList = [];
              bannerList = response.data["data"]
                  .map((banner) => BannerItem(banner["imgUrl"]))
                  .toList();
              store.dispatch(SetBannerAction(bannerList));
              _setTimer();
            });
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
