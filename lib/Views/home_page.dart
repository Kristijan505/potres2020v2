import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:potres2020v2/Models/post.dart';
import 'package:potres2020v2/Widgets/my_scaffold.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    activePage = 0;
    itemsPerPage = 10;
    super.initState();
  }

  int activePage;
  int itemsPerPage;

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      children: <Widget>[
        Container(height: 16),
        FutureBuilder<Box>(
          future: Hive.openBox('posts'),
          builder: (context, box) {
            if (!(box.hasData && box.connectionState == ConnectionState.done))
              return Center(child: CircularProgressIndicator());
            return GestureDetector(
              onHorizontalDragEnd: (dragEndDetails) {
                if (dragEndDetails.primaryVelocity < 0) {
                  goForward(box);
                } else if (dragEndDetails.primaryVelocity > 0) {
                  goBack();
                }
              },
              child: Column(
                children: <Widget>[
                  ...box.data.values
                      .where((element) => element.runtimeType == Post)
                      .skip(activePage * itemsPerPage)
                      .take(itemsPerPage)
                      .toList()
                      .map((e) {
                    return _PostItem(post: e);
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.first_page),
                        onPressed: () => setState(() => activePage = 0),
                      ),
                      IconButton(
                        icon: Icon(Icons.navigate_before),
                        onPressed: () {
                          goBack();
                        },
                      ),
                      Text('${activePage + 1}'),
                      IconButton(
                        icon: Icon(Icons.navigate_next),
                        onPressed: () {
                          goForward(box);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.last_page),
                        onPressed: () {
                          var lastPage = (box.data.values.length ~/ itemsPerPage);
                          setState(() => activePage = lastPage);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  void goBack() {
    if (activePage > 0) {
      setState(() => activePage--);
    }
  }

  void goForward(AsyncSnapshot<Box> box) {
    var lastPage = (box.data.values.length ~/ itemsPerPage);
    if (activePage != lastPage) {
      setState(() => activePage++);
    }
  }
  
  
}

class _PostItem extends StatelessWidget {
  const _PostItem({Key key, this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    final content = (post.content.length > 45) ? ('${post.content.substring(0, 45)}...') : post.content;
    return Card(
      elevation: 1,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 3),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.title, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(content),
            if (post.contact != null && post.contact.isNotEmpty)
              Row(children: [
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black26
                  ),
                  child: Icon(Icons.phone, color: Colors.white, size: 16,),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(post.contact),
                )
              ])
          ],
        ),
      ),
    );
  }
}
