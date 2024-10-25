import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BookHelper {
  static BookHelper bookHelper = BookHelper._();

  BookHelper._();

  Database? _db;

  Future get database async => _db ?? await initDataBase();

  Future<Database?> initDataBase() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, 'book.db');
    _db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        String sql = '''
CREATE TABLE book(
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 title TEXT, 
 author TEXT,
 status TEXT);
''';
        await db.execute(sql);
      },
    );
    return _db;
  }

  Future<void> insertData(String title, String author, String status) async {
    Database? db = await database;
    String sql = '''
    INSERT INTO book(title,author,status) VALUES(?,?,?);
    ''';
    List args = [title, author, status];
    await db!.rawInsert(sql, args);
  }

  Future<List<Map>> readData() async {
    Database? db = await database;
    String sql = '''
    
    SELECT * FROM book
    
    ''';
    return await db!.rawQuery(sql);
  }

  Future<void> delectData(int id) async {
    Database? db = await database;
    String sql = '''
    DELETE FROM book WHERE id=?
    
    ''';
    await db!.rawDelete(sql);
  }

  Future<void> updateData(
      int id, String title, String author, String status) async {
    Database? db = await database;

    String sql = '''
    
    UPDATE con SET title=?, author=?,status=? WHERE id=?;
    ''';
    List arg = [title, author, status, id];
    await db!.rawUpdate(sql, arg);
  }
}
