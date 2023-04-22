import 'package:projeto_saude_faculdade/src/feactures/domain/entities/annotation_entity.dart';

extension AnnotationDto on AnnotationEntity {
  static AnnotationEntity fromJson(Map<String, dynamic> json) {
    return AnnotationEntity(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      nameChild: json['nameChild'],
      annotation: json['annotation'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'nameChild': nameChild,
        'annotation': annotation,
      };
}
