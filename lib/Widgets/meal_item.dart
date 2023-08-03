import 'package:flutter/material.dart';
import 'package:meal_app/Widgets/meal_item_trait.dart';
import 'package:meal_app/models/meals.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({Key? key, required this.meal,required this.onSelectMeal}) : super(key: key);
  final Meal meal;
  final void Function(BuildContext context,Meal meal) onSelectMeal;

  String get complexityText{
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  }

  String get affordabilityText{
    return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
  }



  @override
  Widget build(BuildContext context) {
    return Card(
      //  shape will get ignored due to stack.because stack by default ignores the shape of its parent widget.
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      // to enforce this shape here.which ensures every content that goes out of this shape will simply cut of.
      // we should use clipBehaviour.and this will remove every content of the child widget that will go out of shape
      clipBehavior: Clip.hardEdge,
      elevation: 4,
      child: InkWell(
        onTap: () {
          onSelectMeal(context,meal);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(
                            icons: Icons.schedule,
                            label: '${meal.duration} min',
                          ),
                          const SizedBox(width: 6,),
                          MealItemTrait(
                            icons: Icons.work,
                            label:complexityText,
                          ),
                          const SizedBox(width: 6,),
                          MealItemTrait(
                            icons: Icons.attach_money,
                            label:affordabilityText,
                          )
                        ],
                      )
                    ],
                  ),
                )),
        ]),
      ),
    );
  }
}
