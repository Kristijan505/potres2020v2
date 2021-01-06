import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:pedantic/pedantic.dart';
import 'package:potres2020v2/constants.dart';

part 'tag.g.dart';

@HiveType(typeId: 2)
class Tag {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String tag;

  @HiveField(2)
  final String description;

  Tag({
    this.description,
    this.id,
    this.tag,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json['id'] ?? 0,
      description: json['description'] ?? '',
      tag: json['tag'] ?? '',
    );
  }

  static Future<List<Tag>> fetch() async {
    var newTagsResponse = await http.get('$baseUrl/api/v3/tags').timeout(Duration(seconds: 5), onTimeout: () => http.Response('', 400));
    if (newTagsResponse.statusCode != 200) {
      return <Tag>[];
    }
    return (json.decode(newTagsResponse.body)['results'] as List).map((e) => Tag.fromJson(e)).toList();
  }

  static void save(Future<List<Tag>> tags) async {
    var _tags = await tags;
    var boxTags = await Hive.openBox('tags');
    await boxTags.clear();
    unawaited(boxTags.addAll(_tags));
  }
}
