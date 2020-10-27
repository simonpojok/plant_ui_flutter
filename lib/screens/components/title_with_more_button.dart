import 'package:flutter/material.dart';
import 'package:plant/screens/components/title_with_underline.dart';

import '../../constants.dart';

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