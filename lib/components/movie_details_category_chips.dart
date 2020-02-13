import 'package:flutter/material.dart';
import 'package:FlutterMovieDBApp/components/movie_details_chip.dart';

class CategoryChips extends StatelessWidget {
  final List<dynamic> genres;

  CategoryChips(
    this.genres,
  );

  @override
  Widget build(BuildContext context) {
    // var textTheme = Theme.of(context).textTheme;

    return Row(
      children: genres.map((category) {
        var name = category["name"];

        return Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: CategoryChip(name)
        );
      }).toList()
    );
  }
}



          