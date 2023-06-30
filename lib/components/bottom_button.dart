import './/constant.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key, required this.onPressed, required this.title,
  });

  


  final Function onPressed;

  final String title;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
          onTap: (){
              onPressed();
          },
          child: Container(
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: slatColor,
                      ),
                      child: Center(
          child: Text(title,style: TextStyle(
            fontFamily: "Cairo",
            fontSize: 28,
            fontWeight: FontWeight.bold,color: Colors.white),),
                      ),
                    ),
        ));
  }
}