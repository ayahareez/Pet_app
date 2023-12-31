import 'package:flutter/material.dart';
import 'package:frist_project/data/models/user_data.dart';
import 'package:frist_project/presentation/pages/fav_page.dart';
import 'package:frist_project/presentation/pages/pets_page.dart';

class ControllerPage extends StatefulWidget {
  const ControllerPage({super.key});

  @override
  State<ControllerPage> createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {
  int index = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          PetPage(),
          FavPage(),
        ],
        onPageChanged: (pageIndex) {
          setState(() {
            index = pageIndex;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        backgroundColor: Colors.black,
        onTap: (int newIndex) {
          setState(() {
            index = newIndex;
            pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.pets, color: Colors.white38),
            label: 'Pets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.white38),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}