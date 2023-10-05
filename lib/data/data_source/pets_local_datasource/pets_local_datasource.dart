import 'dart:convert';

import 'package:frist_project/data/data_source/data_source.dart';
import 'package:frist_project/data/models/pet.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PetsLocalData {
  ///this function returns all [Pet]s from the [SharedPreferences]
  ///and it takes no parameter
  Future<List<Pet>> getPets();

  ///this function adds [Pet] to the [SharedPreferences]
  ///and it takes [Pet] object as parameter
  Future<void> setPet(Pet pet);
}

class PetsLocalDataImpl extends PetsLocalData {
  @override
  Future<List<Pet>> getPets() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final List<String> petData = preferences.getStringList('pets') ??
        List.generate(10, (index) => 'Not found');
    List<Pet> pets = [];
    for (int i = 0; i < petData.length - 1; i++) {
      final Map<String, dynamic> petMap = jsonDecode(petData[i]);
      pets.add(Pet.fromMap(petMap));
    }
    return pets;
  }

  @override
  Future<void> setPet(Pet pet) async {
    final String petData = jsonEncode(pet.toMap());
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('pets', petData);
  }

  Future<void> addPetsFirst() async {
    for (int i = 0; i <= 7; i++) {
      setPet(pets[i]);
    }
  }
}