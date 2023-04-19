import 'package:projeto_saude_faculdade/src/feactures/data/datasources/local/database_local.dart';
import 'package:projeto_saude_faculdade/src/feactures/data/dtos/annotation_dto.dart';
import 'package:projeto_saude_faculdade/src/feactures/domain/entities/annotation_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper implements DatabaseLocal<Database> {
  final int _version = 1;
  static const String _dbName = "notes.db";

  @override
  Future<Database> getDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, _dbName),
      onCreate: (db, version) async => await db.execute(
          "CREATE TABLE Note(id INTEGER PRIMARY KEY, title TEXT NOT NULL, description TEXT NOT NULL);"),
      version: _version,
    );
  }

  @override
  Future<int> addNote(Map<String, dynamic> note) async {
    final db = await getDB();
    return await db.insert("note", note,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<int> updateNote(Map<String, dynamic> note, int id) async {
    final db = await getDB();
    return await db.update("note", note,
        where: 'id = ?',
        whereArgs: [id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<int> deleteNote(int id) async {
    final db = await getDB();
    return await db.delete(
      "note",
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<List<AnnotationEntity>?> getAllNotes() async {
    final db = await getDB();
    final List<Map<String, dynamic>> maps = await db.query("note");
    if (maps.isEmpty) {
      return null;
    }
    return List.generate(
        maps.length, (index) => AnnotationDto.fromJson(maps[index]));
  }
}
