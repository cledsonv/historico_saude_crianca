import 'package:flutter/material.dart';
import 'package:projeto_saude_faculdade/src/feactures/domain/entities/annotation_entity.dart';
import 'package:projeto_saude_faculdade/src/feactures/domain/usecases/create_historic_usecase.dart';
import 'package:projeto_saude_faculdade/src/feactures/domain/usecases/delete_historic_usecase.dart';
import 'package:projeto_saude_faculdade/src/feactures/domain/usecases/get_historic_usecase.dart';
import 'package:projeto_saude_faculdade/src/feactures/domain/usecases/list_historic_usecase.dart';
import 'package:projeto_saude_faculdade/src/feactures/domain/usecases/update_historic_usecase.dart';

class AnnotationController extends ChangeNotifier {
  final CreateHistoricUsecase addHistoric;
  final UpdateHistoricUsecase updateHistoric;
  final DeleteHistoricUsecase deleteHistoric;
  final GetHistoricUsecase getHistoric;
  final ListHistoricUsecase listHistoric;

  AnnotationController(this.addHistoric, this.updateHistoric,
      this.deleteHistoric, this.getHistoric, this.listHistoric);

  List<AnnotationEntity> listAnnotation = [];

  init() async {
    list();
    notifyListeners();
  }

  void add(String title, String description, String nameChild) async {
    try {
      await addHistoric.create(
        data: AnnotationEntity(
            title: title,
            description: description,
            nameChild: nameChild,
            annotation: '',
            dateTime: DateTime.now().millisecondsSinceEpoch),
      );
      print(DateTime.now().millisecondsSinceEpoch);
      list();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void update({
    required String title,
    required String description,
    required String nameChild,
    required String id,
    required String annotation,
    required int dateTime,
  }) async {
    try {
      await updateHistoric.update(
        data: AnnotationEntity(
            title: title,
            description: description,
            nameChild: nameChild,
            annotation: annotation,
            id: id,
            dateTime: dateTime),
        id: id,
      );
      list();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void delete({required String id}) async {
    try {
      await deleteHistoric.delete(id: id);
      list();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void get(String? id) async {
    try {
      var result = await getHistoric.get(id: id!);
    } catch (e) {
      print(e);
    }
  }

  void list() async {
    try {
      listAnnotation = await listHistoric.list();
      listAnnotation.sort(
        (a, b) => b.dateTime.compareTo(a.dateTime),
      );
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
