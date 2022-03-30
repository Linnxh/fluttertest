import 'package:fluttertest/redux/actions.dart';
import 'package:redux/redux.dart';

// reducers 是绑定相应的关系
// 设置轮播图
final bannerReducer =
    combineReducers<List>([TypedReducer<List, SetBannerAction>(_setBanner)]);

List _setBanner(List banners, SetBannerAction action) {
  banners = action.banners;
  return banners;
}
