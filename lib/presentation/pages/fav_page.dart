import 'package:flutter/material.dart';
import 'package:frist_project/data/data_source/data_source.dart';
import 'package:frist_project/data/models/pet_provider.dart';
import 'package:frist_project/data/models/user_data.dart';
import 'package:provider/provider.dart';

import '../widgets/pet_grid_tile.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'Favorite Pets',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Consumer<PetProvider>(
                  builder: (BuildContext context, PetProvider value,
                          Widget? child) =>
                      GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                        ),
                        itemBuilder: (BuildContext context, int index) =>
                            PetItem(
                                pet: pets
                                    .where((pet) => pet.isFav == true)
                                    .toList()[index]),
                        itemCount:
                            pets.where((pet) => pet.isFav == true).length,
                      )),
            ),
          ],
        ),
      ),
    );
  }
}