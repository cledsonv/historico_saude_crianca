import 'package:projeto_saude_faculdade/src/feactures/domain/entities/annotation_entity.dart';
import 'package:projeto_saude_faculdade/src/feactures/domain/repositories/historic_repository.dart';
import 'package:projeto_saude_faculdade/src/feactures/domain/usecases/update_historic_usecase.dart';

class UpdateHistoricUsecaseImp implements UpdateHistoricUsecase {
  final HistoricRepository repository;

  UpdateHistoricUsecaseImp(this.repository);

  @override
  Future<Map<String, dynamic>> update(
      {required AnnotationEntity data, required String id}) async {
    return await repository.update(data: data, id: id);
  }
}
