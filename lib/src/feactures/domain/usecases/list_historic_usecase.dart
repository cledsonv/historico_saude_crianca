import 'package:projeto_saude_faculdade/src/feactures/domain/entities/annotation_entity.dart';

abstract class ListHistoricUsecase {
  Future<List<AnnotationEntity>> list();
}
