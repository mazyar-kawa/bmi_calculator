import './/constant.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key, required this.title, required this.onPressed,
  });

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: (){
          onPressed();
        },
        child: Container(
          margin: EdgeInsets.all(5),
          
          width: MediaQuery.of(context).size.width / 1.5,
          height: 60,
          decoration: BoxDecoration(
            color: greenColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(child: Text(title,style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold
          ),)),
        ),
      ),
    );
  }
}