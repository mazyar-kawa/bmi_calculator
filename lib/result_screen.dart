import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';



class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.bmi, required this.interpretation});


  final String bmi;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            orangeColor,
            whiteColor,
          ], begin: Alignment.topCenter / 2, end: Alignment.bottomCenter),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("BMI Result",style: text24Size,),
                Expanded(
                  flex: 4,
                  child: Container(
                  child: SfRadialGauge(
                  axes:<RadialAxis>[
                    RadialAxis(showLabels: false, showAxisLine: false, showTicks: false,
                        minimum: 0, maximum: 40, 
                        ranges: <GaugeRange>[GaugeRange(startValue: 0, endValue: 18.5,
                            color:Color(0xFF00AB47), label: 'Underweight',
                            sizeUnit: GaugeSizeUnit.factor,
                            labelStyle: GaugeTextStyle(fontFamily: 'Times', fontSize:  20),
                            startWidth: 0.65, endWidth: 0.65
                        ),GaugeRange(startValue: 18.5, endValue: 25,
                          color:Color(0xFFFFBA00), label: 'Normal',
                          labelStyle: GaugeTextStyle(fontFamily: 'Times', fontSize:   20),
                          startWidth: 0.65, endWidth: 0.65, sizeUnit: GaugeSizeUnit.factor,
                        ),
                          GaugeRange(startValue: 25, endValue: 40,
                            color: Color(0xFFFE2A25), label: 'Overweight',
                            labelStyle: GaugeTextStyle(fontFamily: 'Times', fontSize:   20),
                            sizeUnit: GaugeSizeUnit.factor,
                            startWidth: 0.65, endWidth: 0.65,
                          ),
          
                        ],
                        pointers: <GaugePointer>[NeedlePointer(value: double.parse(bmi)
                      )]
                    )
                  ],
                ),
                )),
                Expanded(
                  flex: 2,
                  child: Container(
                  
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: slatColor,
                        offset: Offset(0, 3),
                        blurRadius: 5,
                        spreadRadius: -5
                      ),
                    ]
                  ),
                  child: Center(
                    child: Text(interpretation,textAlign: TextAlign.justify,style: TextStyle(
                      color: slatColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                )),
                BottomButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>InputPage()));
                }, title: "Save Result")
              ],
            ),
          ),
        ),
      ),
    );
  }
}