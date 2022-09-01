import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class User {
  final String name;
  final String height;

  User(this.name, this.height);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        height = json['height'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'height': height,
      };
}

class UserPreferences {
  final String height;

  UserPreferences(this.height);

  UserPreferences.fromJson(Map<String, dynamic> json) : height = json['height'];

  Map<String, dynamic> toJson() => {'height': height};
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    User user1;
    User user2;
    UserPreferences userPreferences1;
    UserPreferences userPreferences2;

    Map<String, dynamic> userDetailsMap1 =
        jsonDecode('{"name":"John", "height":"Tall"}');
    user1 = User.fromJson(userDetailsMap1);

    Map<String, dynamic> userDetailsMap2 =
        jsonDecode('{"name":"Ann", "height":"Short"}');
    user2 = User.fromJson(userDetailsMap2);

    Map<String, dynamic> userPreferencesMap1 = jsonDecode('{"height":"Short"}');
    userPreferences1 = UserPreferences.fromJson(userPreferencesMap1);

    Map<String, dynamic> userPreferencesMap2 = jsonDecode('{"height":"Tall"}');
    userPreferences2 = UserPreferences.fromJson(userPreferencesMap2);

    // compare userPreferencesMap1 with userDetailsMap2
    // and     userPreferencesMap2 with userDetailsMap1

    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        // ThemeData
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
          title: user1.name +
              ' is ' +
              user1.height +
              ' preferences is ' +
              userPreferences1.height),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // MyHomePage
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Widget
    return Scaffold(
      appBar: AppBar(
        // AppBar
        title: Text(widget.title),
      ),
      body: Center(
        // Center
        child: Column(
          // Column
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}
