class AlbumItem {
  int id;
  String name;
  String picUrl;
  List<ArtistItem> artists;

  AlbumItem(
      {required this.id,
      required this.artists,
      required this.name,
      required this.picUrl});
}

class ArtistItem {
  int id;
  String name;

  ArtistItem({required this.id, required this.name});
}
