

import 'dart:convert';

import 'package:my_feed/src/models/youtube_response.dart';
import 'package:http/http.dart' as http;

class NetworkService{

  static const List<String> FEED_TYPE = const [
    "superhero",
    "foods",
    "songs",
    "training"
  ];

  static Future<List<Youtube>> fetchYoutubeGET({final type}) async {
    final url =
        'http://codemobiles.com/adhoc/youtubes/index_new.php?username=admin&password=password&type=$type';

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      YoutubeResponse youtube = YoutubeResponse.fromJson(jsonResponse);

//      for (var item in youtube.youtubes) {
//        print(item.title);
//      }

      return youtube.youtubes;
    } else {
      throw Exception('Failed to load Youtubes');
    }
  }


}