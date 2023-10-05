import 'package:flutter/material.dart';
import 'package:frist_project/data/data_source/data_source.dart';
import 'package:frist_project/presentation/widgets/pet_info_tile.dart';

import '../../data/models/pet.dart';

class InfoPage extends StatelessWidget {
  final int index;
  const InfoPage(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:InfoTile(pets[index]),
    );
  }
}
