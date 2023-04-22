import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_saude_faculdade/src/feactures/presenter/controller/annotation_controller.dart';
import 'package:projeto_saude_faculdade/src/feactures/presenter/ui/moleculs/app_bar_home.dart';
import 'package:projeto_saude_faculdade/src/feactures/presenter/ui/moleculs/container_annotation.dart';
import 'package:projeto_saude_faculdade/src/feactures/presenter/ui/moleculs/card_home.dart';
import 'package:projeto_saude_faculdade/src/feactures/presenter/ui/organisms/add_annotation_sheet_botton.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AnnotationController ct = GetIt.I();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController childController = TextEditingController();

  @override
  void initState() {
    ct.init();
    ct.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    childController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            builder: (BuildContext context) {
              return AddAnnotationSheetBotton(
                titleController: titleController,
                descriptionController: descriptionController,
                childController: childController,
                ct: ct,
              );
            },
          ).then((value) {
            setState(() {});
          });
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: CustomScrollView(
            slivers: [
              const AppBarHome(),
              const CardHome(),
              SliverToBoxAdapter(
                child: Text(
                  'Registros',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: ct.listAnnotation.length,
                  (BuildContext context, int idx) {
                    final notation = ct.listAnnotation[idx];
                    return ContainerAnnotation(
                      title: notation.title,
                      description: notation.description,
                      child: notation.nameChild,
                      annotation: notation.annotation,
                      titleController: titleController,
                      descriptionController: descriptionController,
                      childController: childController,
                      ct: ct,
                      onRemove: () {
                        setState(() {
                          ct.delete(id: notation.id!);
                        });
                      },
                      onUpdate: () {
                        setState(() {
                          ct.update(
                              id: notation.id!,
                              title: titleController.text,
                              description: descriptionController.text,
                              nameChild: childController.text);
                          Navigator.pop(context);
                        });
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
