import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/card_container.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/material.dart';



class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.bmi, required this.result, required this.interpretation});

  final String bmi;
  final String result;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Text("BMI RESULT",style: lableBigText,))),

                Expanded(
                  flex: 5,
                  child: CardContainer(
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(result,style: text20Size,),
                        Text(bmi,style: lableBigText,),
                        Text(interpretation,textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 22,
                  ),)
                      ],
                    )),
                ),
            BottomButton(title: "RE-CALCULATE", onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>InputPage()));
            })
          ],
        ),
      ),
    );
  }
}