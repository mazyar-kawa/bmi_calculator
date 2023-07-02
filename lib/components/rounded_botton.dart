import './/constant.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key, required this.onPress, required this.icon,
  });


  final Function onPress;

  final  IconData  icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: greenColor,
      onPressed: () {
        onPress();
      },
      elevation: 6,
      constraints: BoxConstraints.tightFor(
        height: 40,
        width: 40,
      ),
      shape: CircleBorder(),
      child: Icon(icon,color: Colors.white,size: 20,),
    );
  }
}