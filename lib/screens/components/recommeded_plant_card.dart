import 'package:flutter/material.dart';

import '../../constants.dart';

class RecommendedPlantCard extends StatelessWidget {
  const RecommendedPlantCard({
    Key key,
    this.image,
    this.title,
    this.country,
    this.price,
    this.press
  }) : super(key: key);

  final String image, title, country;
  final int price;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding * 2.5
      ),
      width: size.width * 0.4,
      child: Column(
        children: [
          Image.asset(image),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: kPrimaryColor.withOpacity(0.23)
                    )
                  ]
              ),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                              text: title + "\n".toUpperCase(),
                              style: Theme.of(context).textTheme.button
                          ),
                          TextSpan(
                              text: country.toUpperCase(),
                              style: TextStyle(
                                  color: kPrimaryColor.withOpacity(0.5)
                              )
                          ),
                        ]
                    ),
                  ),
                  Spacer(),
                  Text(
                    "\$"+ price.toString(),
                    style: Theme.of(context).textTheme.button.copyWith(
                        color: kPrimaryColor
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
