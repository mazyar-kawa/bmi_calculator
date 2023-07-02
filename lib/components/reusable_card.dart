import './/components/rounded_botton.dart';
import './/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    super.key, required this.title, required this.lableValue, required this.decrease, required this.increase,
  });

  final String title;
  final int lableValue;
  final Function decrease;
  final Function increase;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: text20Size,
        ),
        SizedBox(height: 10,),
        Text(
          '${lableValue}',
          style: lableText,
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RoundedButton(
              icon: FontAwesomeIcons.minus,
              onPress: (){
                decrease();
              },
            ),
            RoundedButton(
              icon: FontAwesomeIcons.plus,
              onPress: (){
                increase();
              },
            )
          ],
        )
      ],
    );
  }
}