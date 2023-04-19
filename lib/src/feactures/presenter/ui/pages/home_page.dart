import 'package:flutter/material.dart';
import 'package:projeto_saude_faculdade/src/feactures/presenter/controller/annotation_controller.dart';
import 'package:projeto_saude_faculdade/src/feactures/presenter/ui/moleculs/container_annotation.dart';
import 'package:projeto_saude_faculdade/src/feactures/presenter/ui/organisms/add_annotation_sheet_botton.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AnnotationController ct = AnnotationController();

  @override
  void initState() {
    ct.listAnnotation;
    super.initState();
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Olá,',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          'Cledson Ventura',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    const Spacer(),
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          'https://media.discordapp.net/attachments/882615192431771668/1078880185170006056/5d138386cb0ff237d0f65cd6a9905ab4.jpg?width=576&height=650'),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Image.network(
                        'https://cdn.discordapp.com/attachments/1071892919633576117/1097452262059683881/image.png',
                        height: 150,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Já regristou algo hoje?',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Registre agora e tenha todo o acompanhamento do seu filho.',
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
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
                      id: notation.id,
                      title: notation.title,
                      description: notation.description,
                      child: notation.child,
                      ct: ct,
                      onRemove: () {
                        setState(() {
                          ct.removeList(notation.id);
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
