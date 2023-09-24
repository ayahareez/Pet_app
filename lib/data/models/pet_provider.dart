
import 'package:flutter/material.dart';
import 'package:frist_project/data/models/pet.dart';

class PetProvider extends ChangeNotifier {
  static Set<Pet> favoritePets = {};

  void toggleFavorite(Pet pet) {
    if (favoritePets.contains(pet)) {
      favoritePets.remove(pet);
    } else {
      favoritePets.add(pet);
    }
    notifyListeners();
  }

  bool isPetFavorite(Pet pet) {
    return favoritePets.contains(pet);
  }
}