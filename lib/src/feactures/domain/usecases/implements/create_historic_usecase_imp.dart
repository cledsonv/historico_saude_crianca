import 'package:projeto_saude_faculdade/src/feactures/domain/entities/annotation_entity.dart';
import 'package:projeto_saude_faculdade/src/feactures/domain/repositories/historic_repository.dart';
import 'package:projeto_saude_faculdade/src/feactures/domain/usecases/create_historic_usecase.dart';

class CreateHistoricUsecaseImp implements CreateHistoricUsecase {
  final HistoricRepository repository;

  CreateHistoricUsecaseImp(this.repository);

  @override
  Future<String> create({required AnnotationEntity data}) {
    return repository.create(data: data);
  }
}
