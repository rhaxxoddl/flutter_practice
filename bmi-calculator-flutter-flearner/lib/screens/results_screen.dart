import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/reusable_card.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
                child: Container(
              child: Center(
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
            )),
            Expanded(
                flex: 5,
                child: ReusableCard(
                  cardColor: kActiveCardColor,
                  cardChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: Text(
                            resultText,
                            style: kResultTextStyle,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          bmiResult,
                          style: kBMITextStyle,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          interpretation,
                          textAlign: TextAlign.center,
                          style: kBodyTextStyle,
                        ),
                      ),
                      BottomButton(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          buttonTitle: 'RE-CALCULATE')
                    ],
                  ),
                ))
          ]),
    );
  }
}
