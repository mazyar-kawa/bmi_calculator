import '../constant.dart';
import 'package:flutter/material.dart';

class PaternCode extends StatelessWidget {
   PaternCode({this.flex=1, required this.titleSection, required this.childCard});


  final int flex;

  final String titleSection;

  final Widget childCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        flex: flex,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titleSection,style: textSection),
              Expanded(
                child: Container(
                  child: childCard,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}