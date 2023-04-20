import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
    );
  }
}
