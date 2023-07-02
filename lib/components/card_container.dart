import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({
    super.key,
    required this.childCard,
  });

  final Widget childCard;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 3),
              blurRadius: 6,
              spreadRadius: -3,
            )
          ]),
      child: childCard,
    );
  }
}