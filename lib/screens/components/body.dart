import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          buildHomeWithSearchContainer(size, context),
          TitleWithMoreButton(text: "More", press: () {},),
          RecommendedPlantCard(),
        ],
      ),
    );
  }
  Container buildHomeWithSearchContainer(Size size, BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          bottom: kDefaultPadding * 0.5
        ),
        height: size.height * 0.2,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
                bottom: kDefaultPadding + 36,
              ),
              height: size.height * 0.2 - 27,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36)
                )
              ),
              child: Row(
                children: [
                  Text(
                    'SafeWork',
                    style: Theme.of(context).textTheme.headline5.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Spacer(),
                  Image.asset("assets/images/logo.png")
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 54,
                margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 50,
                      color: kPrimaryColor.withOpacity(0.23)
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                    SvgPicture.asset("assets/icons/search.svg"),
                  ],
                ),
              ),
            )
          ],
        ),
      );
  }
}

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
          Container(
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
        ],
      ),
    );
  }
}

class TitleWithMoreButton extends StatelessWidget {
  const TitleWithMoreButton({
    Key key,
    this.text,
    this.press
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding
      ),
      child: Row(
        children: [
          TitleWithCustomUnderline(
            text: "Recommended",
          ),
          Spacer(),
          FlatButton(
              color: kPrimaryColor,
              onPressed: press,
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
          )
        ],
      ),
    );
  }
}

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    Key key,
    this.text
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding / 4),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(
                right: kDefaultPadding / 4
              ),
              height: 7,
              color: kPrimaryColor.withOpacity(0.2),
            ),
          )
        ],
      ),
    );
  }
}
