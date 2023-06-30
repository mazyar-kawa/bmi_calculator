import '/constant.dart';
import 'package:flutter/material.dart';

class CardGender extends StatelessWidget {
  const CardGender({
    super.key,
    required this.image,
    required this.title,
    required this.onPressed,
    required this.fontWeight,
    required this.blur,
    required this.colour,
  });

  final String image;
  final String title;

  final Function onPressed;

  final FontWeight fontWeight;

  final double blur;

  final Color colour;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Color(0xFF737373),
                  blurRadius: blur,
                  spreadRadius: -2,
                  offset: Offset(0, 2)),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, width: 55),
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Cairo',
                color: colour,
                fontSize: 16,
                fontWeight: fontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
