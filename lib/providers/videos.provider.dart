import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/video.model.dart';

class VideoProvider {
  Future<List<VideoModel>> obtenerVideos() async {
    List<VideoModel> videos = [];
    var client = http.Client();

    try {
      Map<String, String> parametros = {
        'playlistId': 'PL7bptl9TAMiwi81O-9TG9IQOZ5mi2vxjQ',
        'part': 'snippet',
        'maxResults': '50',
      };

      Map<String, String> cabecera = {
        'X-RapidAPI-Key': '9d4a81f8admshb018546c96d4e95p192481jsn31b03308cc87',
        'X-RapidAPI-Host': 'youtube-v31.p.rapidapi.com',
      };

      var url =
          Uri.https('youtube-v31.p.rapidapi.com', 'playlistItems', parametros);
      var response = await http.get(url, headers: cabecera);
      var decodeResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

      decodeResponse['items']
          .forEach((item) => videos.add(VideoModel.fromJson(item)));

      return videos;
    } finally {
      client.close();
    }
  }
}
