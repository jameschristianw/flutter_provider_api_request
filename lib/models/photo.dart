class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> result) {
    return Photo(
      albumId: result['albumId'],
      id: result['id'],
      title: result['title'],
      url: result['url'],
      thumbnailUrl: result['thumbnailUrl'],
    );
  }
}
