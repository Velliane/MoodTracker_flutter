import 'package:flutter/material.dart';

import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  PageController _controller = PageController(
    initialPage: 2,
  );

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        PageSadMood(),
        PageDisappointedMood(),
        PageNormalMood(),
        PageHappyMood(),
        PageVeryHappyMood(),
      ],
    );
  }
}

class PageSadMood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.red,
      body: Center (
        child: Image.asset('assets/images/smiley_sad.png'),
      ),
    );
  }
}

class PageDisappointedMood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey,
      body: Center (
        child: Image.asset('assets/images/smiley_disappointed.png'),
      ),
    );
  }
}

class PageNormalMood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blue,
      body: Center (
        child: Image.asset('assets/images/smiley_normal.png'),
      ),
    );
  }
}

class PageHappyMood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.orange,
      body: Center (
        child: Image.asset('assets/images/smiley_happy.png'),
      ),
    );
  }
}

class PageVeryHappyMood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.yellow,
      body: Center (
        child: Image.asset('assets/images/smiley_super_happy.png'),
      ),
    );
  }
}

// Database

class Mood {
  final String date;
  final String comment;
  final int mood;

  Mood({this.date, this.comment, this.mood});
}

void initiateDatabase() async {
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  final Future<Database> database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
      join(await getDatabasesPath(), 'mood_database.db'),
      onCreate: (db, version) {
        return db.execute(
            "CREATE TABLE table_moods(Date DATE PRIMARY KEY NOT NULL, Comment TEXT, Mood INTEGER)",
        );
      },
  version: 1,
  );

  Future<void> saveMood(Mood mood) async {
    final Database db = await database;
  }
}

