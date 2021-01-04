import 'dart:async';
import 'package:flutter/material.dart';
import 'package:potres2020v2/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isBusy = false;
  bool isLoggedIn = false;
  String errorMessage;
  String name;
  String picture;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}

List<BottomNavigationBarItem> bottomItems = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Početna',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.input),
    label: 'Unos',
  ),
];

Timer timerFetch;
