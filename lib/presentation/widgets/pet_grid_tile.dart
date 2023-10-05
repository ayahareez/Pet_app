import 'package:flutter/material.dart';
import 'package:frist_project/data/models/pet.dart';
import 'package:frist_project/data/models/pet_provider.dart';
import 'package:provider/provider.dart';

import '../../data/data_source/data_source.dart';
import '../pages/page_pet_info.dart';

class PetItem extends StatefulWidget {
  //final int index;
  final Pet pet;
  const PetItem({super.key, required this.pet});

  @override
  State<PetItem> createState() => _PetItemState();
}

class _PetItemState extends State<PetItem> {
  bool isFav = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isFav=widget.pet.isFav;

  }
  @override
  Widget build(BuildContext context) {

    //final  petProvider = Provider.of<PetProvider>(context);
    //final  isFavorite = petProvider.isPetFavorite(widget.pet);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => InfoPage(widget.pet.id)));
        },
        child: SizedBox(
          width: 120,
          height: 120,
          child: GridTile(
            footer: Container(
              height: 50,
              color: Colors.purple.withOpacity(0.5),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.pet.name,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Consumer<PetProvider>(
                    builder: (BuildContext context, value, Widget? child) =>
                        Checkbox(
                            value: isFav,
                            onChanged: (value) {
                              //petProvider.toggleFavorite(widget.pet);
                              setState(() {
                                isFav=value!;
                                widget.pet.isFav=value;
                              });
                            }),
                  )
                ],
              ),
            ),
            child: Image.asset(
              widget.pet.imageUrl,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
