import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:potres2020v2/constants.dart';

class Media {
  final int id;
  final String caption;
  final String originalFileUrl;

  Media({
    this.id,
    this.caption,
    this.originalFileUrl,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      id: json['id'] ?? 0,
      caption: json['caption'] ?? '',
      originalFileUrl: json['original_file_url'] ?? '',
    );
  }

  static Future<Media> fetch(int id) async {
    var mediaResponse = await http.get('$baseUrl/api/v3/media/$id').timeout(Duration(seconds: 5), onTimeout: () => http.Response('', 400));
    if (mediaResponse.statusCode != 200) {
      return null;
    }
    return Media.fromJson(json.decode(mediaResponse.body) as Map<String, dynamic>);
  }
}
