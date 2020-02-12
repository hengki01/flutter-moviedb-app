import 'package:flutter/material.dart';

class Poster extends StatelessWidget {
  static const POSTER_RATIO = 0.7;

  Poster(
    this.posterPath, {
    this.height = 100.0,
  });

  final String posterPath;
  final double height;

  @override
  Widget build(BuildContext context) {
    var width = POSTER_RATIO * height;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.network(
        "http://image.tmdb.org/t/p/w500" + posterPath,
        fit: BoxFit.cover,
        width: width,
        height: height,
      ),
    );
  }
}