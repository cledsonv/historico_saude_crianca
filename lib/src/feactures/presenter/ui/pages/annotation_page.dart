import 'package:flutter/material.dart';

class AnnotationPage extends StatelessWidget {
  const AnnotationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Titulo'),
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
