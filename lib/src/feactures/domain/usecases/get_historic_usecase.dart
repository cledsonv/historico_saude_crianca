import 'package:projeto_saude_faculdade/src/feactures/domain/entities/annotation_entity.dart';

abstract class GetHistoricUsecase {
  Future<AnnotationEntity> get({required String id});
}
