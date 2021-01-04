import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:potres2020v2/Models/post.dart';
import 'package:potres2020v2/Widgets/myScaffold.dart';

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
        Container(height: 20),
        FutureBuilder<Box>(
          future: Hive.openBox('posts'),
          builder: (context, box) {
            if (!(box.hasData && box.connectionState == ConnectionState.done)) return Center(child: CircularProgressIndicator());
            return Column(
              children: <Widget>[
                Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: <TableRow>[
                    TableRow(children: <Widget>[
                      Container(padding: EdgeInsets.all(2), child: Text('Naslov')),
                      Container(padding: EdgeInsets.all(2), child: Text('Opis')),
                      Container(padding: EdgeInsets.all(2), child: Text('Kontakt')),
                    ]),
                    ...box.data.values
                        .where((element) => element.runtimeType == Post)
                        .skip(activePage * itemsPerPage)
                        .take(itemsPerPage)
                        .toList()
                        .map((e) => TableRow(children: <Widget>[
                              Container(padding: EdgeInsets.all(2), child: Text((e.title.length > 30) ? ('${e.title.substring(0, 30)}...') : e.title)),
                              Container(padding: EdgeInsets.all(2), child: Text((e.content.length > 30) ? ('${e.content.substring(0, 30)}...') : e.content)),
                              Container(padding: EdgeInsets.all(2), child: Text(e.contact ?? '')),
                            ]))
                        .toList(),
                  ],
                ),
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
                        if (activePage > 0) {
                          setState(() => activePage--);
                        }
                      },
                    ),
                    Text('${activePage + 1}'),
                    IconButton(
                      icon: Icon(Icons.navigate_next),
                      onPressed: () {
                        var lastPage = (box.data.values.length ~/ itemsPerPage);
                        if (activePage != lastPage) {
                          setState(() => activePage++);
                        }
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
            );
          },
        ),
      ],
    );
  }
}
