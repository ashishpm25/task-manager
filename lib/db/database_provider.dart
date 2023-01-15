import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:task_manager/tab_bar_pages/Notes.dart';

class DatabaseProvider{
  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();
  static Database? _database;

  Future<Database?> get database async{

    if (_database != null){
      return _database;
    }
    _database = await initDB();
    return _database;

  }

  initDB() async{
    return await openDatabase(join(await getDatabasesPath(),'note_app.db'),
        onCreate: (db,version) async{
      await db.execute('''
      CREATE TABLE notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        body TEXT,
      );
      DROP TABLE notes;''');
    },version: 1);
  }
  addNewNote(NoteModel note) async{
    final db = await database;
    db?.insert('notes', note.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
  }
  Future<dynamic> getNotes() async{
      final db = await database;
      var res = await db?.query('notes');
      if (res?.length == 0 ){return Null;}else{var resultMap = res?.toList();return res;}
  }
}
