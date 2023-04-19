import 'package:projeto_saude_faculdade/src/feactures/domain/entities/annotation_entity.dart';

abstract class DatabaseLocal<T> {
  Future<T> getDB();
  Future<int> addNote(Map<String, dynamic> note);
  Future<int> updateNote(Map<String, dynamic> note, int id);
  Future<int> deleteNote(int id);
  Future<List<AnnotationEntity>?> getAllNotes();
}
