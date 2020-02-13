import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double voteAverage;

  StarRating(this.voteAverage);

  @override
  Widget build(BuildContext context) {
    var stars = <Widget>[];

    for (var i = 1; i <= 10; i++) {
      var color = i<=voteAverage ? Colors.orange : Colors.grey[400];
      var star = Icon(
        Icons.star,
        color: color,
        size: 15
      );
      stars.add(star);
    }
    return Row(children: stars);
  }
}