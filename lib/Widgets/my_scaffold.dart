import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:potres2020v2/main.dart';

class MyScaffold extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final int bottomNavBarCurrentIndex;

  MyScaffold({
    this.title = 'Potres2020',
    this.children,
    this.bottomNavBarCurrentIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.cleaning_services),
          onPressed: () async {
            var boxPosts = await Hive.openBox('posts');
            var boxDateTimes = await Hive.openBox('dateTimes');
            await boxPosts.clear();
            await boxDateTimes.clear();
          },
        )
      ]),
      body: CupertinoScrollbar(
        child: ListView(
          children: children ?? <Widget>[],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomItems,
        currentIndex: bottomNavBarCurrentIndex,
        onTap: (_) {
          switch (_) {
            case 0:
              Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
              break;
            case 1:
              Navigator.pushNamedAndRemoveUntil(context, '/input', (route) => false);
              break;
            default:
              Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
          }
        },
      ),
    );
  }
}
