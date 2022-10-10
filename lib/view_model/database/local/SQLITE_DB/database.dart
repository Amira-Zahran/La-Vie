import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';

class SQLHelper {

  static Future<Database> initDb() async {
    return sql.openDatabase(
      'odcWorkshop.db', //database name
      version: 1, //version number
      onCreate: (Database database, int version) async {
        await createTable(database);
      },
    );
  }

  static Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE notes(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        description TEXT
      )
      """);



    debugPrint("table Created");
  }



  //add
  static Future<int> addNote(String title, String descrption) async {
    final db = await SQLHelper.initDb(); //open database
    final data = {'title': title, 'description': descrption}; //create data in map
    final id = await db.insert('notes', data);  //insert
    debugPrint("Data Added");
    return id;
  }

//read all plants
  static Future<List<Map<String, dynamic>>> getNotes() async {
    final db = await SQLHelper.initDb();
    return db.query('notes', orderBy: "id");
  }




  //get plant by id
  static Future<List<Map<String, dynamic>>> getnote(int id) async {
    final db = await SQLHelper.initDb();
    return db.query('notes', where: "id = ?", whereArgs: [id]);
  }


  //update
  static Future<int> updateNote(
      int id, String title, String? descrption) async {
    final db = await SQLHelper.initDb();
    final data = {
      'title': title,
      'description': descrption,
    };

    final result =
    await db.update('notes', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static Future<void> deleteNote(int id) async {
    final db = await SQLHelper.initDb();
    try {
      await db.delete("notes", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      print("Something went wrong when : $err");
    }
  }
}
