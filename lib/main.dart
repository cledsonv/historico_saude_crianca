import 'package:flutter/material.dart';
import 'package:projeto_saude_faculdade/src/core/inject/inject.dart';
import 'package:projeto_saude_faculdade/src/feactures/my_app.dart';

void main() {
  Inject.initialize();
  runApp(const MyApp());
}
