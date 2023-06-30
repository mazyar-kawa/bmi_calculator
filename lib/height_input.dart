import 'package:bmi_calculator/calculate_brain.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/patern_widget.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import './components/appBar.dart';

class HeightInput extends StatefulWidget {
  const HeightInput({super.key, required this.weight});


  final double weight;

  @override
  State<HeightInput> createState() => _HeightInputState();
}

class _HeightInputState extends State<HeightInput> {
  double height = 170;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: AppBarCustome(
              title: '',
            ),
            preferredSize: Size(double.infinity, 50)),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              orangeColor,
              whiteColor,
            ], begin: Alignment.topCenter / 2, end: Alignment.bottomCenter),
          ),
          child: Column(
            children: [
              PaternCode(
                titleSection: "Height",
                flex: 6,
                childCard: Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(
                        'images/height1.png',
                        height: height * 2.5,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SfLinearGauge(
                          minimum: 145,
                          maximum: 199,
                          orientation: LinearGaugeOrientation.vertical,
                          markerPointers: [
                            LinearWidgetPointer(
                              animationType: LinearAnimationType.bounceOut,
                              value: height,
                              position: LinearElementPosition.outside,
                              offset: 5,
                              child: Icon(Icons.play_arrow),
                              onChanged: (value) {
                                setState(() {
                                  height = value;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BottomButton(
                title: "Get Result",
                onPressed: () {
                  final result = CalculateBrain(height: height, weight: weight);

                  Navigator.push(context, MaterialPageRoute(builder: (_)=>ResultScreen(bmi: result.getCalculateMBI(), interpretation: result.getInterpretation())));

                })
            ],
          ),
        ));
  }
}
