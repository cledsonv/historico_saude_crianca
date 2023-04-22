class AnnotationEntity {
  String? id;
  final String title;
  final String description;
  final String nameChild;
  String? annotation;

  AnnotationEntity(
      {this.id,
      required this.title,
      required this.description,
      required this.nameChild,
      this.annotation});
}
