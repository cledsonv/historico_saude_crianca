import 'package:flutter/material.dart';
import 'package:projeto_saude_faculdade/src/feactures/presenter/controller/annotation_controller.dart';

class AnnotationPage extends StatefulWidget {
  final AnnotationController ct;
  final String annotation;
  final String title;
  final String id;
  final String description;
  final String nameChild;
  const AnnotationPage({
    super.key,
    required this.annotation,
    required this.ct,
    required this.title,
    required this.id,
    required this.description,
    required this.nameChild,
  });

  @override
  State<AnnotationPage> createState() => _AnnotationPageState();
}

class _AnnotationPageState extends State<AnnotationPage> {
  TextEditingController annotationController = TextEditingController();
  @override
  void initState() {
    annotationController.text = widget.annotation;
    super.initState();
  }

  @override
  void dispose() {
    annotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.deepPurple[50],
        leading: IconButton(
            onPressed: () {
              widget.ct.update(
                  title: widget.title,
                  description: widget.description,
                  nameChild: widget.nameChild,
                  id: widget.id,
                  annotation: annotationController.text);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.ct.update(
              title: widget.title,
              description: widget.description,
              nameChild: widget.nameChild,
              id: widget.id,
              annotation: annotationController.text);
        },
        child: const Icon(Icons.save),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
            child: TextFormField(
              controller: annotationController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Escreva algo...'),
            ),
          ),
        ],
      ),
    );
  }
}
