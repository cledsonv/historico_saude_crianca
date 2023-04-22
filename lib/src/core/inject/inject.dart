import 'package:get_it/get_it.dart';
import 'package:projeto_saude_faculdade/src/feactures/data/datasources/local/local_datasource.dart';
import 'package:projeto_saude_faculdade/src/feactures/data/datasources/local/local_datasource_imp.dart';
import 'package:projeto_saude_faculdade/src/feactures/data/repositories/historic_repository_imp.dart';
import 'package:projeto_saude_faculdade/src/feactures/domain/repositories/historic_repository.dart';
import 'package:projeto_saude_faculdade/src/feactures/domain/usecases/create_historic_usecase.dart';
import 'package:projeto_saude_faculdade/src/feactures/domain/usecases/delete_historic_usecase.dart';
import 'package:projeto_saude_faculdade/src/feactures/domain/usecases/get_historic_usecase.dart';
import 'package:projeto_saude_faculdade/src/feactures/domain/usecases/implements/create_historic_usecase_imp.dart';
import 'package:projeto_saude_faculdade/src/feactures/domain/usecases/implements/delete_historic_usecase_imp.dart';
import 'package:projeto_saude_faculdade/src/feactures/domain/usecases/implements/get_historic_usecase_imp.dart';
import 'package:projeto_saude_faculdade/src/feactures/domain/usecases/implements/list_historic_usecase_imp.dart';
import 'package:projeto_saude_faculdade/src/feactures/domain/usecases/implements/update_historic_usecase_imp.dart';
import 'package:projeto_saude_faculdade/src/feactures/domain/usecases/list_historic_usecase.dart';
import 'package:projeto_saude_faculdade/src/feactures/domain/usecases/update_historic_usecase.dart';
import 'package:projeto_saude_faculdade/src/feactures/presenter/controller/annotation_controller.dart';

class Inject {
  static initialize() {
    GetIt getIt = GetIt.instance;

    //datasource
    getIt.registerLazySingleton<LocalDatasource>(() => LocalDatasourceImp());

    //repository
    getIt.registerLazySingleton<HistoricRepository>(
        () => HistoricRepositoryImp(getIt()));

    //usecases
    getIt.registerLazySingleton<CreateHistoricUsecase>(
        () => CreateHistoricUsecaseImp(getIt()));
    getIt.registerLazySingleton<UpdateHistoricUsecase>(
        () => UpdateHistoricUsecaseImp(getIt()));
    getIt.registerLazySingleton<DeleteHistoricUsecase>(
        () => DeleteHistoricUsecaseImp(getIt()));
    getIt.registerLazySingleton<GetHistoricUsecase>(
        () => GetHistoricUsecaseImp(getIt()));
    getIt.registerLazySingleton<ListHistoricUsecase>(
        () => ListHistoricUsecaseImp(getIt()));

    //controller
    getIt.registerLazySingleton<AnnotationController>(() =>
        AnnotationController(getIt(), getIt(), getIt(), getIt(), getIt()));
  }
}
