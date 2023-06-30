import './/constant.dart';
import 'package:flutter/material.dart';

class AppBarCustome extends StatelessWidget {
  const AppBarCustome({
    super.key, required this.title,
  });


  final String title;


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: orangeColor,
      elevation: 0,
      title: Text(
        title,
        style: text24Size,
      ),
    );
  }
}