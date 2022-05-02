import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants.dart';

class OneIconOneText extends StatelessWidget {
  final String label;
  final IconData icon;

  const OneIconOneText(
      {this.label = 'Sex', this.icon = FontAwesomeIcons.questionCircle});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: kIconSize,
        ),
        SizedBox(
          height: kGapIconAndLabel,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
