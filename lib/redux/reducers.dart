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

// 设置推荐歌单
final recommendPlayListReducer = combineReducers<List>(
    [TypedReducer<List, SetRecommendPlayListAction>(_setRecommendPlayList)]);

List _setRecommendPlayList(
    List recommendPlayList, SetRecommendPlayListAction action) {
  recommendPlayList = action.recommendPlayList;
  return recommendPlayList;
}

// 设置新歌
final newSongReducer = combineReducers<List>(
    [TypedReducer<List, SetNewSongAction>(_setNewSongList)]);

List _setNewSongList(List newSong, SetNewSongAction action) {
  newSong = action.newSong;
  return newSong;
}

// 设置新碟
final newAlbumReducer = combineReducers<List>(
    [TypedReducer<List, SetNewAlbumAction>(_setNewAlbumList)]);

List _setNewAlbumList(List newAlbum, SetNewAlbumAction action) {
  newAlbum = action.newAlbum;
  return newAlbum;
}

/********************************************************************/
// 设置是否是新歌
final showNewSongReducer = combineReducers<bool>(
    [TypedReducer<bool, SetShowNewSongAction>(_setShowNewSongList)]);

bool _setShowNewSongList(bool showNewSong, SetShowNewSongAction action) {
  showNewSong = action.showNewSong;
  return showNewSong;
}
