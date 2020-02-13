import 'package:flutter/material.dart';
import 'package:FlutterMovieDBApp/utils/genre_match.dart';

class GenresList extends StatelessWidget {
  final List<dynamic> genreIDs;
  final List<dynamic> listGenres;

  GenresList(
    this.genreIDs,
    this.listGenres,
  );

  buildGenreChips(genreIDs, listGenres) {
    List<String> matchedGenres = matchingGenre(genreIDs, listGenres);

    return matchedGenres.map((genreName) {
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Chip(
          label: Text(
            genreName,
            style: TextStyle(color: Colors.white),
          ),
          // labelStyle: textTheme.caption,
          backgroundColor: Colors.black,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: buildGenreChips(genreIDs, listGenres)
      )
    );
  }
}