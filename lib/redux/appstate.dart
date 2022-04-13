import 'package:fluttertest/redux/reducers.dart';

class AppState {
  List banners; // 轮播图
  List recommendPlayList; // 推荐歌单
  List newAlbum; // 新碟
  List newSong; // 新歌
  bool showNewSong; // 是否显示新歌
  AppState(
      {required this.banners,
      required this.recommendPlayList,
      required this.newAlbum,
      required this.newSong,
      required this.showNewSong});
}

AppState appReducer(AppState state, action) {
  return AppState(
      banners: bannerReducer(state.banners, action),
      recommendPlayList:
          recommendPlayListReducer(state.recommendPlayList, action),
      newAlbum: newAlbumReducer(state.newAlbum, action),
      newSong: newSongReducer(state.newSong, action),
      showNewSong: showNewSongReducer(state.showNewSong, action));
}
