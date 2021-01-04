import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:potres2020v2/Models/tag.dart';

part 'post.g.dart';

@HiveType(typeId: 1)
class Post {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String content;

  @HiveField(3)
  final double lon;

  @HiveField(4)
  final double lat;

  @HiveField(5)
  final DateTime created;

  @HiveField(6)
  final List<Tag> tags;

  @HiveField(7)
  final String contact;

  @HiveField(8)
  final String content2;

  @HiveField(9)
  final DateTime updated;

  Post({
    this.contact,
    this.content,
    this.content2,
    this.id,
    this.lat,
    this.lon,
    this.created,
    this.tags,
    this.title,
    this.updated,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    var _lon = 0.0;
    try {
      _lon = double.tryParse(json['values']['73c25387-b131-4396-87aa-91fcfe8a707e'][0]['lon'].toString());
    } catch (e) {}
    if (_lon == 0.0) {
      try {
        _lon = double.tryParse(json['values']['87e86d94-df5d-4eb5-9080-5a4d44a5f769'][0]['lon'].toString());
      } catch (e) {}
    }
    var _lat = 0.0;
    try {
      _lat = double.tryParse(json['values']['73c25387-b131-4396-87aa-91fcfe8a707e'][0]['lon'].toString());
    } catch (e) {}
    if (_lat == 0.0) {
      try {
        _lat = double.tryParse(json['values']['87e86d94-df5d-4eb5-9080-5a4d44a5f769'][0]['lat'].toString());
      } catch (e) {}
    }
    var _contact = '';
    try {
      _contact = json['values']['1328cf24-09de-44cd-b159-6242e6165530'][0];
    } catch (e) {}
    var _contact2 = '';
    try {
      _contact2 = json['values']['9fc48dff-6c03-4dc9-b4f3-3e22544d99f9'][0];
    } catch (e) {}
    return Post(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      lon: _lon,
      lat: _lat,
      created: DateTime.tryParse(json['created']) ?? DateTime(1980),
      tags: ((json['tags'] ?? []) as List).map((e) => Tag.fromJson(e)).toList(),
      contact: _contact,
      content2: _contact2,
      updated: DateTime.tryParse(json['updated'].toString()) ?? DateTime(1980),
    );
  }

  static Future<List<Post>> fetchNew(DateTime dateTimeTo) async {
    var boxDateTimes = await Hive.openBox('dateTimes');
    var dateTimeFrom = boxDateTimes.get('createdAfter', defaultValue: DateTime(1980)) as DateTime;
    var newPostsResponse = await http.get('https://potres2020.openit.hr/api/v3/posts?created_before=$dateTimeTo&created_after=$dateTimeFrom').timeout(Duration(seconds: 5), onTimeout: () => http.Response('', 400));
    if (newPostsResponse.statusCode != 200) {
      return <Post>[];
    }
    return (json.decode(newPostsResponse.body)['results'] as List).map((e) => Post.fromJson(e)).toList();
  }

  static Future<List<Post>> fetchUpdated(DateTime dateTimeTo) async {
    var boxDateTimes = await Hive.openBox('dateTimes');
    var dateTimeFrom = boxDateTimes.get('updatedAfter', defaultValue: DateTime(1980)) as DateTime;
    var updatedPostsResponse = await http.get('https://potres2020.openit.hr/api/v3/posts?updated_before=$dateTimeTo&updated_after=$dateTimeFrom').timeout(Duration(seconds: 5), onTimeout: () => http.Response('', 400));
    if (updatedPostsResponse.statusCode != 200) {
      return <Post>[];
    }
    return (json.decode(updatedPostsResponse.body)['results'] as List).map((e) => Post.fromJson(e)).toList();
  }

  static Future<bool> addNew(Post post) {
    
  }
}
