class AnnotationEntity {
  String? id;
  final String title;
  final String description;
  final String nameChild;
  String? annotation;
  final int dateTime;

  AnnotationEntity({
    this.id,
    required this.title,
    required this.description,
    required this.nameChild,
    this.annotation,
    required this.dateTime,
  });
}
