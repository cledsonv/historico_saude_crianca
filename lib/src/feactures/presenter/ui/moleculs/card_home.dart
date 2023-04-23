import 'package:flutter/material.dart';

class CardHome extends StatelessWidget {
  const CardHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.purple[50],
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
    );
  }
}
