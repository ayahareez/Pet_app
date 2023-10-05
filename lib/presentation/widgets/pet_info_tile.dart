import 'package:flutter/material.dart';
import 'package:frist_project/data/models/pet.dart';

class InfoTile extends StatelessWidget {
  final Pet pet;

  const InfoTile(this.pet, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'ID # ${pet.id} ${pet.name}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              pet.imageUrl,
              fit: BoxFit.cover,
            ),
            Text(
              'ID: ${pet.id}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Name: ${pet.name}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 8,
            ),
            const Text(
              'Tips:',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${pet.tips}'),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                child:
                    const Text('ADOPT', style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}