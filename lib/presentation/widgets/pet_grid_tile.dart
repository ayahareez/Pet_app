import 'package:flutter/material.dart';
import 'package:frist_project/data/models/pet.dart';
import 'package:frist_project/data/models/pet_provider.dart';
import 'package:provider/provider.dart';

import '../../data/data_source/data_source.dart';
import '../pages/page_pet_info.dart';

class PetItem extends StatefulWidget {
final int index;
const PetItem({super.key, required this.index});

  @override
  State<PetItem> createState() => _PetItemState();
}

class _PetItemState extends State<PetItem> {
bool isFav=false;


  @override
  Widget build(BuildContext context) {
    final petProvider=Provider.of<PetProvider>(context);
    final isFavorite=petProvider.isPetFavorite(pets[widget.index]);

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>InfoPage(widget.index)));
        },
        child: SizedBox(
          width: 120,
          height: 120,
          child: GridTile(
            footer:Container(
              height: 50,
              color: Colors.purple.withOpacity(0.5),
              alignment: Alignment.center,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    pets[widget.index].name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18
                    ),
                  ),
                  Checkbox(
                      value: isFavorite,
                      onChanged: (value){
                        petProvider.toggleFavorite(pets[widget.index]);
                        // setState(() {
                        //   isFav=value!;
                        //
                        // });
                      })
                ],
              ),
            ),
            child: Image.asset(pets[widget.index].imageUrl,
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

