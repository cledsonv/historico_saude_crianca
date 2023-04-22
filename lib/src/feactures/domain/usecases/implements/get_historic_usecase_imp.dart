import 'package:projeto_saude_faculdade/src/feactures/domain/entities/annotation_entity.dart';
import 'package:projeto_saude_faculdade/src/feactures/domain/repositories/historic_repository.dart';
import 'package:projeto_saude_faculdade/src/feactures/domain/usecases/get_historic_usecase.dart';

class GetHistoricUsecaseImp implements GetHistoricUsecase {
  final HistoricRepository repository;

  GetHistoricUsecaseImp(this.repository);

  @override
  Future<AnnotationEntity> get({required String id}) {
    return repository.get(id: id);
  }
}
