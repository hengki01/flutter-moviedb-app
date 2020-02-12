import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double voteAverage;

  StarRating(this.voteAverage);

  @override
  Widget build(BuildContext context) {
    var stars = <Widget>[];

    for (var i = 1; i <= 10; i++) {
      var star = Icon(
        Icons.star,
        color: Colors.orange,
        size: 15
      );
      stars.add(star);
    }
    return Row(children: stars);
  }
}