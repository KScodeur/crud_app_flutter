// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import "package:path/path.dart";
// import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../Models/user_model.dart';

class UsersDatabase {
  UsersDatabase._();
  static final UsersDatabase instance = UsersDatabase._();
  static const int _version = 1;
  static const String _dbName = "Users.db";
  static const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
  static const integerType = "INTEGER NOT NULL";
  static const textType = "TEXT NOT NULL";
  static const userTable = "user";

  static final UsersDatabase db = UsersDatabase._();
  static var _database;
  // UsersDatabase._init();
  static Future<Database> get databases async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _initDB("Users.db");
      return _database;
    }
  }

  static _initDB(String filePath) async {
    WidgetsFlutterBinding.ensureInitialized();
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: _version, onCreate: _onCreateDB);
  }

  static _onCreateDB(Database databases, int version) async {
    return await databases.execute('''
     CREATE TABLE user(
       id INTEGER PRIMARY KEY AUTOINCREMENT,
       firstName TEXT NOT NULL,
       lastName TEXT NOT NULL,
       age INTEGER NOT NULL
    )
     ''');
  }

 

  static Future<int> addUsers(User user) async {
    final db = await databases;
    return await db.insert('user', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    //  user;
  }

  static Future<List<User>> getAllUsers() async {
    final Database db = await databases;
    // Database db = await instance.database;
    final List<Map<String, dynamic>> queryResult =
        await db.query("user");
    // if (queryResult.isEmpty) {
    //   return null;
    // }
    return List.generate(
        queryResult.length, (index) => User.fromJson(queryResult[index]));
  }

  static Future<int> updateUser(User user) async {
    // final db = await _getDB();
    Database db = await databases;

    return db.update(userTable, user.toMap(),
        where: 'id=?',
        whereArgs: [user.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteUser(User user) async {
  final  Database db = await databases;

    // final db = await _getDB();
    return await db.delete(userTable, where: 'id=?', whereArgs: [user.id]);
  }

    // static _onCreateDB(Database databases, int version) async {
    // return await databases.execute('''
    //  CREATE TABLE user(
    //    id INTEGER PRIMARY KEY AUTOINCREMENT,
    //    firstName TEXT NOT NULL,
    //    lastName TEXT NOT NULL,
    //    age INTEGER NOT NULL
    // )
    //  ''');
  // }

  // Future close() async {
  //   final db = await instance.database;

  //   db.close();
  // }
}
