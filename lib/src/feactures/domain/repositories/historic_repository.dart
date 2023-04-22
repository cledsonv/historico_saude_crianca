import 'package:projeto_saude_faculdade/src/feactures/domain/entities/annotation_entity.dart';

abstract class HistoricRepository {
  Future<String> create({required AnnotationEntity data});
  Future<Map<String, dynamic>> update(
      {required AnnotationEntity data, required String id});
  Future<String> delete({required String id});
  Future<AnnotationEntity> get({required String id});
  Future<List<AnnotationEntity>> list();
}
