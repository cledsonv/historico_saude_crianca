import 'package:projeto_saude_faculdade/src/feactures/data/datasources/local/data_table_enum.dart';
import 'package:projeto_saude_faculdade/src/feactures/data/datasources/local/local_datasource.dart';
import 'package:projeto_saude_faculdade/src/feactures/data/dtos/annotation_dto.dart';
import 'package:projeto_saude_faculdade/src/feactures/domain/entities/annotation_entity.dart';
import 'package:projeto_saude_faculdade/src/feactures/domain/repositories/historic_repository.dart';
import 'package:uuid/uuid.dart';

class HistoricRepositoryImp implements HistoricRepository {
  final LocalDatasource dataBase;

  HistoricRepositoryImp(this.dataBase);

  var table = DataTables.historic;
  final Uuid _uuid = const Uuid();

  @override
  Future<String> create({required AnnotationEntity data}) async {
    String id = _uuid.v4();
    data.id = id;
    print(id);
    return await dataBase.create(data: data.toJson(), table: table, id: id);
  }

  @override
  Future<Map<String, dynamic>> update(
      {required AnnotationEntity data, required String id}) async {
    if (data.id == null) {
      print(data.toJson());
      print(id);
      print('vvvvvvvvvvvvvvvvvvvvvvvvvvvvv');
    }
    print('CCC');
    var result =
        await dataBase.update(data: data.toJson(), table: table, id: id);
    return result;
  }

  @override
  Future<String> delete({required String id}) async {
    return await dataBase.delete(table: table, id: id);
  }

  @override
  Future<AnnotationEntity> get({required String id}) async {
    var take = await dataBase.get(table: table, id: id);
    var result = AnnotationDto.fromJson(take!);
    return result;
  }

  @override
  Future<List<AnnotationEntity>> list() async {
    var take = await dataBase.list(table: table);
    var result = take.map((e) => AnnotationDto.fromJson(e)).toList();
    return result;
  }
}
