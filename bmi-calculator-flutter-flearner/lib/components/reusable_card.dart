import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class ReusableCard extends StatelessWidget {
  final Color cardColor;
  final Widget cardChild;

  ReusableCard(
      {this.cardColor = kInactiveCardColor,
      this.cardChild = kDefaultCardChild}) {
    print('ReusableCard');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

class SelectCard extends StatelessWidget {
  final Color cardColor;
  final Widget cardChild;
  final VoidCallback onPress;

  SelectCard(
      {this.cardColor = kInactiveCardColor,
      this.cardChild = kDefaultCardChild,
      required this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: ReusableCard(
        cardChild: cardChild,
        cardColor: cardColor,
      ),
    );
  }
}
