import 'package:flutter/material.dart';

import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

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