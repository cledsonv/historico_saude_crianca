import 'dart:math';
import 'package:flutter/material.dart';
import 'package:projeto_saude_faculdade/src/feactures/domain/entities/annotation_entity.dart';

class AnnotationController extends ChangeNotifier {
  final List<AnnotationEntity> listAnnotation = [];

  void addList(String title, String description, String child) {
    listAnnotation.add(
      AnnotationEntity(
          title: title,
          description: description,
          id: Random().nextDouble().toString(),
          child: child),
    );
    notifyListeners();
  }

  void updateList(String id, String title, String description, String child) {
    listAnnotation.where((e) {
      if (e.id == id) {
        e.title = title;
        e.description = description;
        e.child = child;
      }
      print(listAnnotation);
      return true;
    });
  }

  void removeList(String id) {
    listAnnotation.removeWhere((e) => e.id == id);
    notifyListeners();
  }
}
