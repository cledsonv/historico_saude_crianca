import 'package:projeto_saude_faculdade/src/feactures/domain/entities/annotation_entity.dart';

abstract class UpdateHistoricUsecase {
  Future<Map<String, dynamic>> update(
      {required AnnotationEntity data, required String id});
}
