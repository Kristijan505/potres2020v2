import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pedantic/pedantic.dart';
import 'package:potres2020v2/Models/post.dart';
import 'package:potres2020v2/Models/tag.dart';
import 'package:potres2020v2/main.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    initHive().then((value) => Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false));
  }

  Future<bool> initHive() async {
    var path = (await getTemporaryDirectory()).path;
    Hive.init(path);
    if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(PostAdapter());
    if (!Hive.isAdapterRegistered(2)) Hive.registerAdapter(TagAdapter());
    var isOpenedPosts = await Hive.isBoxOpen('posts');
    if (!isOpenedPosts) await Hive.openBox('posts');
    var isOpenedTags = await Hive.boxExists('tags');
    if (!isOpenedTags) await Hive.openBox('tags');
    var isOpenedUnsentPosts = await Hive.boxExists('unsentPosts');
    if (!isOpenedUnsentPosts) await Hive.openBox('unsentPosts');
    var isOpenedDateTimes = await Hive.boxExists('dateTimes');
    if (!isOpenedDateTimes) await Hive.openBox('dateTimes');
    Tag.save(Tag.fetch());
    timerFetch = Timer.periodic(Duration(seconds: 15), (timer) async {
      var boxPosts = await Hive.openBox('posts');
      var newPosts = await Post.fetchNew();
      if (newPosts.isNotEmpty) {
        for (var newPost in newPosts) {
          await boxPosts.put(newPost.id, newPost);
        }
      }
      var updatedPosts = await Post.fetchUpdated();
      if (updatedPosts.isNotEmpty) {
        for (var updatedPost in updatedPosts) {
          await boxPosts.put(updatedPost.id, updatedPost);
        }
      }
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: FlutterLogo(size: 200),
    );
  }
}
