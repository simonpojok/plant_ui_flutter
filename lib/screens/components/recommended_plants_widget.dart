import 'package:flutter/material.dart';
import 'package:plant/screens/components/recommeded_plant_card.dart';

class RecommendedPlant extends StatelessWidget {
  const RecommendedPlant({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          RecommendedPlantCard(
            image: "assets/images/image_1.png",
            title: "Samantha",
            country: "Russia",
            price: 440,
            press: () {},
          ),
          RecommendedPlantCard(
            image: "assets/images/image_2.png",
            title: "Banana",
            country: "Uganda",
            price: 640,
            press: () {},
          ),
          RecommendedPlantCard(
            image: "assets/images/image_3.png",
            title: "Pineapple",
            country: "Kenya",
            price: 100,
            press: () {},
          ),
        ],
      ),
    );
  }
}
