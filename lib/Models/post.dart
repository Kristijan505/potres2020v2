import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:potres2020v2/Models/tag.dart';
import 'package:potres2020v2/constants.dart';

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
  final String longDesc;

  @HiveField(9)
  final DateTime updated;

  @HiveField(10)
  final String conclusion;

  @HiveField(11)
  final String imageId;

  @HiveField(12)
  final List<String> waterConnection;

  @HiveField(13)
  final List<String> electricConnection;

  @HiveField(14)
  final String image2Id;

  Post({
    this.contact,
    this.content,
    this.longDesc,
    this.id,
    this.lat,
    this.lon,
    this.created,
    this.tags,
    this.title,
    this.updated,
    this.conclusion,
    this.imageId,
    this.waterConnection,
    this.electricConnection,
    this.image2Id,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    var _lon = 0.0;
    try {
      _lon = double.tryParse(json['values']['73c25387-b131-4396-87aa-91fcfe8a707e'][0]['lon'].toString()); //nudimPomoc
    } catch (e) {}
    if (_lon == 0.0) {
      try {
        _lon = double.tryParse(json['values']['87e86d94-df5d-4eb5-9080-5a4d44a5f769'][0]['lon'].toString()); //trazimPomoc
      } catch (e) {}
    }
    if (_lon == 0.0) {
      try {
        _lon = double.tryParse(json['values']['2ea15c6b-9330-41bf-97f4-14860747e715'][0]['lon'].toString()); //voda
      } catch (e) {}
    }
    if (_lon == 0.0) {
      try {
        _lon = double.tryParse(json['values']['1258717f-8c5d-413e-ae53-a1041fab4b9b'][0]['lon'].toString()); //struja
      } catch (e) {}
    }
    if (_lon == 0.0) {
      try {
        _lon = double.tryParse(json['values']['3add35d8-3db1-443d-a59a-6635852c5157'][0]['lon'].toString()); //ljudiZaZbrinuti
      } catch (e) {}
    }
    if (_lon == 0.0) {
      try {
        _lon = double.tryParse(json['values']['33af904f-0ce6-4f4c-b277-4677dec5aad7'][0]['lon'].toString()); //opskrbniPunkt
      } catch (e) {}
    }
    if (_lon == 0.0) {
      try {
        _lon = double.tryParse(json['values']['808b965b-bbda-483a-b2fc-ab47a1b8dedf'][0]['lon'].toString()); //smjestajOtvoreno
      } catch (e) {}
    }

    var _lat = 0.0;
    try {
      _lat = double.tryParse(json['values']['73c25387-b131-4396-87aa-91fcfe8a707e'][0]['lon'].toString()); //nudimPomoc
    } catch (e) {}
    if (_lat == 0.0) {
      try {
        _lat = double.tryParse(json['values']['87e86d94-df5d-4eb5-9080-5a4d44a5f769'][0]['lat'].toString()); //trazimPomoc
      } catch (e) {}
    }
    if (_lat == 0.0) {
      try {
        _lat = double.tryParse(json['values']['2ea15c6b-9330-41bf-97f4-14860747e715'][0]['lat'].toString()); //voda
      } catch (e) {}
    }
    if (_lat == 0.0) {
      try {
        _lat = double.tryParse(json['values']['1258717f-8c5d-413e-ae53-a1041fab4b9b'][0]['lat'].toString()); //struja
      } catch (e) {}
    }
    if (_lat == 0.0) {
      try {
        _lat = double.tryParse(json['values']['3add35d8-3db1-443d-a59a-6635852c5157'][0]['lat'].toString()); //ljudiZaZbrinuti
      } catch (e) {}
    }
    if (_lat == 0.0) {
      try {
        _lat = double.tryParse(json['values']['33af904f-0ce6-4f4c-b277-4677dec5aad7'][0]['lat'].toString()); //opskrbniPunkt
      } catch (e) {}
    }
    if (_lat == 0.0) {
      try {
        _lat = double.tryParse(json['values']['808b965b-bbda-483a-b2fc-ab47a1b8dedf'][0]['lat'].toString()); //smjestajOtvoreno
      } catch (e) {}
    }

    var _contact = '';
    try {
      _contact = json['values']['1328cf24-09de-44cd-b159-6242e6165530'][0]; //nudimPomoc
    } catch (e) {}
    if (_contact == '') {
      try {
        _contact = json['value']['4583d2a1-331a-4da2-86df-3391e152198e'][0]; //trazimPomoc
      } catch (e) {}
    }
    if (_contact == '') {
      try {
        _contact = json['value']['e69eb279-0431-4f20-b6b4-1e4a8d2e8c25'][0]; //voda
      } catch (e) {}
    }
    if (_contact == '') {
      try {
        _contact = json['value']['f0fb2d88-9e80-4451-a133-0da68291f209'][0]; //struja
      } catch (e) {}
    }
    if (_contact == '') {
      try {
        _contact = json['value']['85049b38-19b2-4ae6-aa2c-7cd8f3396002'][0]; //ljudiZaZbrinuti
      } catch (e) {}
    }
    if (_contact == '') {
      try {
        _contact = json['value']['0db5de85-fbc7-4825-b748-7a522a5afffa'][0]; //opskrbniPunkt
      } catch (e) {}
    }
    if (_contact == '') {
      try {
        _contact = json['value']['565b4056-373e-4c91-9e5c-fbcd2b4f7d1a'][0]; //smjestajOtvoreno
      } catch (e) {}
    }

    var _longDesc = '';
    try {
      _longDesc = json['values']['9fc48dff-6c03-4dc9-b4f3-3e22544d99f9'][0]; //nudimPomoc
    } catch (e) {}
    if (_longDesc == '') {
      try {
        _longDesc = json['values']['3c8441b3-5744-48bb-9d9e-d6ec4be50613'][0]; //trazimPomoc
      } catch (e) {}
    }
    if (_longDesc == '') {
      try {
        _longDesc = json['values']['8d334184-6470-4ebf-b931-1226d2912494'][0]; //ljudiZaZbrinuti
      } catch (e) {}
    }

    var _conclusion = '';
    try {
      _conclusion = json['values']['9219c2a8-f90b-48f0-b506-4bf81c6f185e'][0]; //nudimPomoc
    } catch (e) {}
    if (_conclusion == '') {
      try {
        _conclusion = json['values']['6b541a6d-eb02-4824-8662-a741da46b2b3'][0]; //trazimPomoc
      } catch (e) {}
    }
    if (_conclusion == '') {
      try {
        _conclusion = json['values']['ca972cb5-dfac-4a22-834a-e073d2520138'][0]; //voda
      } catch (e) {}
    }
    if (_conclusion == '') {
      try {
        _conclusion = json['values']['1362be95-31ed-49a3-a36a-487d14558cdb'][0]; //struja
      } catch (e) {}
    }
    if (_conclusion == '') {
      try {
        _conclusion = json['values']['adb46f07-c953-4e01-9dde-a58ba867fcc0'][0]; //ljudiZaZbrinuti
      } catch (e) {}
    }
    if (_conclusion == '') {
      try {
        _conclusion = json['values']['0df64ab0-9cde-4149-a3e2-c593b687eb5f'][0]; //opskrbniPunkt
      } catch (e) {}
    }
    if (_conclusion == '') {
      try {
        _conclusion = json['values']['17e84a96-9d98-4279-8971-e666eb5fab95'][0]; //smjestajOtvoreno
      } catch (e) {}
    }

    var _imageId = '';
    try {
      _imageId = json['values']['925cbd75-0ac3-4b78-a386-4e138cd68a79'][0]; //trazimPomoc
    } catch (e) {}
    if (_imageId == '') {
      try {
        _imageId = json['values']['273e5afd-e980-4995-89f1-a2946dd822a6'][0]; //opskrbniPunkt
      } catch (e) {}
    }
    if (_imageId == '') {
      try {
        _imageId = json['values']['3ef1acd9-2d90-489d-a9d5-eaef27c08bbd'][0]; //smjestajOtvoreno
      } catch (e) {}
    }

    var _waterConnection = <String>[];
    try {
      _waterConnection = json['values']['633278fa-cfd3-4080-8f84-290d518a2522']; //voda
    } catch (e) {}

    var _electricConnection = <String>[];
    try {
      _electricConnection = json['values']['7377b11d-c121-4e60-a71e-ce199ca88942']; //struja
    } catch (e) {}

    var _image2Id = '';
    try {
      _image2Id = json['values']['acc28a6a-1469-4017-a112-c5e888655456'][0]; //opskrbniPunkt
    } catch (e) {}
    if (_image2Id == '') {
      try {
        _image2Id = json['values']['23703990-3d1d-4fde-8143-39063577d6fa'][0]; //smjestajOtvoreno
      } catch (e) {}
    }

    return Post(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      lon: _lon,
      lat: _lat,
      created: DateTime.tryParse(json['created']) ?? DateTime(1980),
      tags: ((json['tags'] ?? []) as List).map((e) => Tag.fromJson(e)).toList(),
      contact: _contact,
      longDesc: _longDesc,
      updated: DateTime.tryParse(json['updated'].toString()) ?? DateTime(1980),
      conclusion: _conclusion,
      imageId: _imageId,
      waterConnection: _waterConnection,
      electricConnection: _electricConnection,
      image2Id: _image2Id,
    );
  }

  static Future<List<Post>> fetchNew() async {
    var boxDateTimes = await Hive.openBox('dateTimes');
    var dateTimeFrom = boxDateTimes.get('createdAfter', defaultValue: DateTime(1980)) as DateTime;
    var newPostsResponse = await http.get('$baseUrl/api/v3/posts?order=asc&orderBy=id&limit=10&created_after=$dateTimeFrom').timeout(Duration(seconds: 5), onTimeout: () => http.Response('', 400));
    if (newPostsResponse.statusCode != 200) {
      return <Post>[];
    }
    var _posts = (json.decode(newPostsResponse.body)['results'] as List).map((e) => Post.fromJson(e)).toList();
    if (_posts.isNotEmpty) await boxDateTimes.put('createdAfter', _posts.last.created);
    return _posts;
  }

  static Future<List<Post>> fetchUpdated() async {
    var boxDateTimes = await Hive.openBox('dateTimes');
    var dateTimeFrom = boxDateTimes.get('updatedAfter', defaultValue: DateTime(1980)) as DateTime;
    var updatedPostsResponse = await http.get('$baseUrl/api/v3/posts?updated_after=$dateTimeFrom').timeout(Duration(seconds: 5), onTimeout: () => http.Response('', 400));
    if (updatedPostsResponse.statusCode != 200) {
      return <Post>[];
    }
    var _posts = (json.decode(updatedPostsResponse.body)['results'] as List).map((e) => Post.fromJson(e)).toList();
    if (_posts.isNotEmpty) await boxDateTimes.put('updatedAfter', _posts.last.updated);
    return _posts;
  }

  static Future<bool> addNew(Post post) {}
}
