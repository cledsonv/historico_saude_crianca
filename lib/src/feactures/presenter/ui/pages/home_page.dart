import 'package:flutter/material.dart';
import 'package:projeto_saude_faculdade/src/feactures/presenter/ui/molecules/card_system_widget.dart';
import 'package:projeto_saude_faculdade/src/feactures/presenter/ui/pages/register_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RegisterPage(),
            ),
          );
        },
        icon: const Icon(Icons.edit),
        label: const Text('Registrar'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
              SliverGrid.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: const [
                  CardSystemWidget(),
                  CardSystemWidget(),
                  CardSystemWidget(),
                  CardSystemWidget(),
                  CardSystemWidget(),
                ],
              ),
              // Container(
              //   height: 200,
              //   margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              //   decoration: BoxDecoration(
              //     color: Colors.blueGrey[100],
              //     borderRadius: BorderRadius.circular(20),
              //   ),
              //   child: Column(
              //     children: const [
              //       Text('Criança'),
              //       Text('Descriçao do que ta sendo colocado no negocio')
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
