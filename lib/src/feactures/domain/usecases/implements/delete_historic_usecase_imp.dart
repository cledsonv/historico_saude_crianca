import 'package:projeto_saude_faculdade/src/feactures/domain/repositories/historic_repository.dart';
import 'package:projeto_saude_faculdade/src/feactures/domain/usecases/delete_historic_usecase.dart';

class DeleteHistoricUsecaseImp implements DeleteHistoricUsecase {
  final HistoricRepository repository;

  DeleteHistoricUsecaseImp(this.repository);

  @override
  Future<String> delete({required String id}) {
    return repository.delete(id: id);
  }
}
