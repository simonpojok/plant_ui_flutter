import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant/constants.dart';
import 'package:plant/screens/components/recommended_plants_widget.dart';
import 'package:plant/screens/components/title_with_more_button.dart';

import 'home_with_search_contianer.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          buildHomeWithSearchContainer(size, context),
          TitleWithMoreButton(text: "More", press: () {},),
          RecommendedPlant(),
        ],
      ),
    );
  }
}