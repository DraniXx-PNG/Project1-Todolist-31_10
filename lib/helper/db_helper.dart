import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  
  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'todolistEdit');

    print("Database path: $path");

   
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        print("Membuat tabel tasks...");
        await db.execute('''
          CREATE TABLE tasks(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            isDone INTEGER,
            priority TEXT
          )
        ''');
      },
    );
  }

 
  Future<int> insertTask(Map<String, dynamic> task) async {
    final client = await db;
    return await client.insert('tasks', task);
  }

 
  Future<List<Map<String, dynamic>>> getTasks() async {
    final client = await db;
    return await client.query('tasks', orderBy: 'id DESC');
  }

    
  Future<int> updateTask(int id, Map<String, dynamic> updatedTask) async {
    final client = await db;
    return await client.update(
      'tasks',
      updatedTask,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

 
  Future<int> deleteTask(int id) async {
    final client = await db;
    return await client.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

 
  Future getNames() async {}
  Future<void> insertName(String text) async {}
  Future<void> updateName(int id, String trim) async {}
  Future<void> deleteName(int id) async {}
}