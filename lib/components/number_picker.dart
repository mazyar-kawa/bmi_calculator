import './/constant.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class NumberPickerSlider extends StatelessWidget {
   NumberPickerSlider({
    super.key,this.age, required this.onChanged,
  });


   final int? age;

  final Function(int value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: slatColor,
            offset: Offset(0, 3),
            blurRadius: 5,
            spreadRadius: -5
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NumberPicker(minValue: 10, maxValue: 99, value: age!, onChanged: (value){
               onChanged(value);
          },axis: Axis.horizontal,selectedTextStyle: TextStyle(
            fontSize: 24,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
            color: slatColor,
          )),
          Image.asset('images/triangle1.png',width: 20,)
        ],
      ),
    );
  }
}