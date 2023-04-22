import 'package:projeto_saude_faculdade/src/feactures/domain/entities/annotation_entity.dart';
import 'package:projeto_saude_faculdade/src/feactures/domain/repositories/historic_repository.dart';
import 'package:projeto_saude_faculdade/src/feactures/domain/usecases/list_historic_usecase.dart';

class ListHistoricUsecaseImp implements ListHistoricUsecase {
  final HistoricRepository repository;

  ListHistoricUsecaseImp(this.repository);

  @override
  Future<List<AnnotationEntity>> list() {
    return repository.list();
  }
}
