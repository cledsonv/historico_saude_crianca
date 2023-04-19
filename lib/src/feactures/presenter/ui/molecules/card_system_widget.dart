import 'package:flutter/material.dart';

class CardSystemWidget extends StatelessWidget {
  const CardSystemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      elevation: 1,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 22, 16, 0),
        child: Column(
          children: [
            Image.network(
              'https://cdn2.iconfinder.com/data/icons/virus-12/512/medical_illness_healthcare_sickness_difficult_breathing_breath-512.png',
              height: 100,
            ),
            const SizedBox(height: 10),
            Text(
              'Registrar doenças',
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
      ),
    );
  }
}
