import 'package:flutter/material.dart';
import 'package:projeto_saude_faculdade/src/feactures/presenter/controller/annotation_controller.dart';

class AddAnnotationSheetBotton extends StatefulWidget {
  final AnnotationController ct;
  final String title;
  final String description;
  final String child;
  final bool isEdit;
  final void Function()? onUpdate;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController childController;

  const AddAnnotationSheetBotton({
    super.key,
    required this.ct,
    this.title = '',
    this.description = '',
    this.child = '',
    this.isEdit = false,
    this.onUpdate,
    required this.titleController,
    required this.descriptionController,
    required this.childController,
  });

  @override
  State<AddAnnotationSheetBotton> createState() =>
      _AddAnnotationSheetBottonState();
}

class _AddAnnotationSheetBottonState extends State<AddAnnotationSheetBotton> {
  @override
  void initState() {
    widget.titleController.text = widget.title;
    widget.descriptionController.text = widget.description;
    widget.childController.text = widget.child;
    super.initState();
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
            'Registrar',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          TextFormField(
            controller: widget.titleController,
            maxLength: 40,
            decoration: const InputDecoration(
              labelText: 'Título',
            ),
          ),
          TextFormField(
            controller: widget.descriptionController,
            maxLength: 300,
            maxLines: null,
            decoration: const InputDecoration(
              labelText: 'Descrição',
            ),
          ),
          TextFormField(
            controller: widget.childController,
            maxLines: null,
            decoration: const InputDecoration(
              labelText: 'Nome do Filho',
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: widget.isEdit
                ? widget.onUpdate
                : () {
                    setState(() {
                      widget.ct.add(
                          widget.titleController.text,
                          widget.descriptionController.text,
                          widget.childController.text);
                      Navigator.pop(context);
                    });
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
