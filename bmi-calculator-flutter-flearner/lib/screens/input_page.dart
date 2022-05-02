import 'results_screen.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/round_Icon_Button.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/calcultaorBrain.dart';

enum GenderType {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  GenderType currentSex = GenderType.male;
  int height = 170;
  int weight = 60;
  int age = 20;

  void selectGender(GenderType sex) {
    currentSex = sex;

    if (currentSex == GenderType.male) {
      maleCardColor = kActiveCardColor;
      femaleCardColor = kInactiveCardColor;
    } else if (currentSex == GenderType.female) {
      maleCardColor = kInactiveCardColor;
      femaleCardColor = kActiveCardColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
          backgroundColor: Color(0xFF0A0E21),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: SelectCard(
                    onPress: () {
                      setState(() {
                        selectGender(GenderType.male);
                      });
                    },
                    cardColor: maleCardColor,
                    cardChild: OneIconOneText(
                      label: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectGender(GenderType.female);
                      });
                    },
                    child: SelectCard(
                        onPress: () {
                          setState(() {
                            selectGender(GenderType.female);
                          });
                        },
                        cardColor: femaleCardColor,
                        cardChild: OneIconOneText(
                          label: 'FEMALE',
                          icon: FontAwesomeIcons.venus,
                        )),
                  ),
                ),
              ],
            )),
            Expanded(
              child: ReusableCard(
                cardColor: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderThemeData(
                            inactiveTrackColor: Color(0xFF8D8E98),
                            activeTrackColor: Colors.white,
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x35EB1555),
                          ),
                          child: Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max: 220.0,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.toInt();
                                });
                              }),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      cardColor: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                    print('weight');
                                  });
                                },
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardColor: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                    print('age');
                                  });
                                },
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              buttonTitle: "CALCULATE",
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsScreen(
                              bmiResult: calc.calculateBMI(),
                              resultText: calc.getResult(),
                              interpretation: calc.getInterpretation(),
                            )));
              },
            )
          ],
        ));
  }
}
