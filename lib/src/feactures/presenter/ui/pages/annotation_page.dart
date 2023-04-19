import 'package:flutter/material.dart';
import 'package:projeto_saude_faculdade/src/feactures/domain/entities/annotation_entity.dart';

class AnnotationPage extends StatelessWidget {
  static const routeName = '/annotation';
  const AnnotationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as AnnotationEntity;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
        backgroundColor: Colors.deepPurple[50],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
            child: TextFormField(
              initialValue: 'adadada',
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
