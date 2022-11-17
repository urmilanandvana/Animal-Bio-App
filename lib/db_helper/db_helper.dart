import 'dart:typed_data';

import 'package:animal_app/model/model.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../global/global.dart';
import 'api_helper.dart';

class DBHelper {
  DBHelper._();
  static final DBHelper dbHelper = DBHelper._();

  final String dbName = 'animal.db';
  final String tableName = 'animals';

  final String colId = 'id';
  final String colMonth = 'time';
  final String colPrice = 'price';
  final String colImage = 'image';
  final String colTitle = 'title';
  final String colDescription = 'description';
  final String colCategories = 'categories';
  // final String colIcon = 'icon';
  // final String colIconName = 'icon_name';

  Database? db;
  Future<void> initDB() async {
    String directory = await getDatabasesPath();
    String path = join(directory, dbName);

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        String query =
            "CREATE TABLE IF NOT EXISTS $tableName($colId  INTEGER PRIMARY KEY AUTOINCREMENT,$colImage BLOB,$colMonth INTEGER,$colPrice INTEGER, $colTitle TEXT)";
        await db.execute(query);
      },
    );
  }

  insertSecondScreen({required List<SecondScreenInsert> data}) async {
    await initDB();
    for (int i = 0; i < data.length; i++) {
      Uint8List? image = await APIHelper.apiHelper.imageAPI();

      String query =
          "INSERT INTO $tableName($colMonth, $colPrice, $colImage) VALUES(?, ?, ?)";
      List arg = [data[i].time, data[i].price, image];

      await db?.rawInsert(query, arg);
    }
  }

  Future<List<SecondScreenFetch>> fetchSecondScreen(
      {required List<SecondScreenInsert> data}) async {
    await initDB();
    await updateImage(length: data.length);
    await insertSecondScreen(data: data);
    String query = "SELECT * FROM $tableName";

    List<Map<String, dynamic>> res = await db!.rawQuery(query);

    List<SecondScreenFetch> secondFetchList =
        res.map((e) => SecondScreenFetch.fromData(e)).toList();

    return secondFetchList;
  }

  Future<void> updateImage({required int length}) async {
    await initDB();
    for (int i = 0; i < length; i++) {
      Uint8List? image = await APIHelper.apiHelper.imageAPI();

      String query =
          "UPDATE $tableName SET $colImage = ? WHERE $colId = ${i + 1}";
      List arg = [image];
      await db?.rawUpdate(query, arg);
    }
  }

  insertLastScreen({required List<LastScreenInsert> data}) async {
    await initDB();
    for (int i = 0; i < data.length; i++) {
      String query =
          "INSERT INTO $tableName($colTitle,$colCategories, $colDescription, $colImage) VALUES(?, ?, ?, ?)";
      List arg = [
        data[i].name,
        data[i].category,
        data[i].description,
        data[i].image
      ];

      await db?.rawInsert(query, arg);
    }
  }

  Future<List<LastScreenFetch>> fetchLastScreen(
      {required List<LastScreenInsert> data}) async {
    await initDB();
    await insertLastScreen(data: data);
    String query = (Global.categores == "")
        ? "SELECT * FROM $tableName"
        : "SELECT * FROM $tableName WHERE $colCategories LIKE '%${Global.categores}%'";

    List<Map<String, dynamic>> arg = await db!.rawQuery(query);
    List<LastScreenFetch> lastScreenFetch =
        arg.map((e) => LastScreenFetch.fromData(e)).toList();
    return lastScreenFetch;
  }
}
