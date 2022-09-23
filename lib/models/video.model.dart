class VideoModel {
  String id;
  String title;
  String thumbnail;

  VideoModel({
    required this.id,
    required this.title,
    required this.thumbnail,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        id: json["id"] ?? '',
        title: json["snippet"]["title"] ?? '',
        thumbnail: json["snippet"]["thumbnails"]["high"]["url"] ?? '',
      );
}
