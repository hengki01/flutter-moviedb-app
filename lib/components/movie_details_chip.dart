import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String name;

  CategoryChip(
    this.name,
  );

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Chip(
      label: Text(
        name,
        style: TextStyle(color: Colors.white),
      ),
      labelStyle: textTheme.caption,
      backgroundColor: Colors.black,
    );
  }
}



          