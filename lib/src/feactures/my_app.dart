import 'package:flutter/material.dart';
import 'package:projeto_saude_faculdade/src/feactures/presenter/ui/pages/annotation_page.dart';
import 'package:projeto_saude_faculdade/src/feactures/presenter/ui/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Organizador de ideias',
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(centerTitle: true),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/annotation': (context) => const AnnotationPage(),
      },
    );
  }
}
