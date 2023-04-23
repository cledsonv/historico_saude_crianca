import 'package:flutter/material.dart';
import 'package:projeto_saude_faculdade/src/feactures/presenter/controller/annotation_controller.dart';
import 'package:projeto_saude_faculdade/src/feactures/presenter/ui/organisms/add_annotation_sheet_botton.dart';
import 'package:projeto_saude_faculdade/src/feactures/presenter/ui/pages/annotation_page.dart';

class ContainerAnnotation extends StatefulWidget {
  final String title;
  final String description;
  final String nameChild;
  final String id;
  final String? annotation;
  final AnnotationController ct;
  final void Function() onUpdate;
  final void Function() onRemove;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController childController;
  final int dateTime;

  const ContainerAnnotation(
      {super.key,
      required this.title,
      required this.description,
      required this.nameChild,
      required this.ct,
      required this.onRemove,
      required this.onUpdate,
      required this.titleController,
      required this.descriptionController,
      required this.childController,
      this.annotation,
      required this.id, required this.dateTime});

  @override
  State<ContainerAnnotation> createState() => _ContainerAnnotationState();
}

class _ContainerAnnotationState extends State<ContainerAnnotation> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AnnotationPage(
              id: widget.id,
              title: widget.title,
              ct: widget.ct,
              annotation: widget.annotation!,
              description: widget.description,
              nameChild: widget.nameChild,
              dateTime:  widget.dateTime,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 7, bottom: 7),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(14),
          ),
          color: Colors.purple[50],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      builder: (BuildContext context) {
                        return AddAnnotationSheetBotton(
                          ct: widget.ct,
                          title: widget.title,
                          description: widget.description,
                          child: widget.nameChild,
                          isEdit: true,
                          onUpdate: widget.onUpdate,
                          titleController: widget.titleController,
                          descriptionController: widget.descriptionController,
                          childController: widget.childController,
                        );
                      },
                    ).then(
                      (value) {
                        setState(
                          () {},
                        );
                      },
                    );
                  },
                  child: const Icon(
                    Icons.edit,
                  ),
                ),
                GestureDetector(
                  onTap: widget.onRemove,
                  child: const Icon(Icons.delete),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              widget.description,
            ),
            const Divider(color: Colors.black, thickness: 0.8),
            Text(widget.nameChild)
          ],
        ),
      ),
    );
  }
}
