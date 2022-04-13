// 设置轮播图
class SetBannerAction {
  final List banners;

  SetBannerAction(this.banners);
}

// 设置推荐歌单
class SetRecommendPlayListAction {
  final List recommendPlayList;

  SetRecommendPlayListAction(this.recommendPlayList);
}

// 设置新歌
class SetNewSongAction {
  final List newSong;

  SetNewSongAction(this.newSong);
}

// 设置新碟
class SetNewAlbumAction {
  final List newAlbum;

  SetNewAlbumAction(this.newAlbum);
}

// 设置是否是新歌
class SetShowNewSongAction {
  final bool showNewSong;

  SetShowNewSongAction(this.showNewSong);
}
