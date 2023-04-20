import 'package:flutter/material.dart';
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
  final AnnotationController ct = AnnotationController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController childController = TextEditingController();

  @override
  void initState() {
    ct.listAnnotation;
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
              // SliverToBoxAdapter(
              //   child: SegmentedButton<int>(
              //     style: ButtonStyle(
              //       textStyle: MaterialStateProperty.resolveWith(
              //         (states) {
              //           if (states.contains(MaterialState.selected)) {
              //             return const TextStyle(fontSize: 9);
              //           }
              //           return const TextStyle(fontSize: 10);
              //         },
              //       ),
              //     ),
              //     segments: const [
              //       ButtonSegment(
              //         value: 0,
              //         label: Text('Todos'),
              //       ),
              //       ButtonSegment(
              //         value: 1,
              //         label: Text('Medicaçôes'),
              //       ),
              //       ButtonSegment(
              //         value: 2,
              //         label: Text('Alergias'),
              //       ),
              //       ButtonSegment(
              //         value: 3,
              //         label: Text('Doenças'),
              //       ),
              //       ButtonSegment(
              //         value: 4,
              //         label: Text('Consultas'),
              //       ),
              //     ],
              //     onSelectionChanged: (value) {},
              //     selected: const {3},
              //   ),
              // ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: ct.listAnnotation.length,
                  (BuildContext context, int idx) {
                    final notation = ct.listAnnotation[idx];
                    return ContainerAnnotation(
                      id: notation.id,
                      title: notation.title,
                      description: notation.description,
                      child: notation.child,
                      titleController: titleController,
                      descriptionController: descriptionController,
                      childController: childController,
                      ct: ct,
                      onRemove: () {
                        setState(() {
                          ct.removeList(notation.id);
                        });
                      },
                      onUpdate: () {
                        setState(() {
                          ct.updateList(notation.id, titleController.text,
                              descriptionController.text, childController.text);
                        });
                        Navigator.pop(context);
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
