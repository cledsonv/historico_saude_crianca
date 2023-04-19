import 'package:flutter/material.dart';
import 'package:projeto_saude_faculdade/src/feactures/presenter/controller/annotation_controller.dart';

class AddAnnotationSheetBotton extends StatefulWidget {
  final AnnotationController ct;
  final String title;
  final String description;
  final String child;
  final String? id;
  final bool isEdit;

  const AddAnnotationSheetBotton(
      {super.key,
      required this.ct,
      this.title = '',
      this.description = '',
      this.child = '',
      this.isEdit = false,
      this.id});

  @override
  State<AddAnnotationSheetBotton> createState() =>
      _AddAnnotationSheetBottonState();
}

class _AddAnnotationSheetBottonState extends State<AddAnnotationSheetBotton> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController childController = TextEditingController();
  @override
  void initState() {
    titleController.text = widget.title;
    descriptionController.text = widget.description;
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Anotar',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          TextFormField(
            controller: titleController,
            maxLength: 40,
            decoration: const InputDecoration(
              labelText: 'Título',
            ),
          ),
          TextFormField(
            controller: descriptionController,
            maxLength: 300,
            maxLines: null,
            decoration: const InputDecoration(
              labelText: 'Descrição',
            ),
          ),
          TextFormField(
            controller: childController,
            maxLines: null,
            decoration: const InputDecoration(
              labelText: 'Nome do Filho',
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: widget.isEdit
                ? () {
                    titleController.text = widget.title;
                    descriptionController.text = widget.description;
                    widget.ct.updateList(widget.id!, titleController.text,
                        descriptionController.text, childController.text);
                    Navigator.pop(context);
                  }
                : () {
                    widget.ct.addList(titleController.text,
                        descriptionController.text, childController.text);
                    Navigator.pop(context);
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple[50],
              minimumSize: Size(MediaQuery.of(context).size.width * 1, 50),
            ),
            child: const Text('Salvar'),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
