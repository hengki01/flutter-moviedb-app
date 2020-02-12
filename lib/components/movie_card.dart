import 'package:flutter/material.dart';
import 'package:myapp/components/movie_card_genres_list.dart';

// Possible Refactor: using InheritedWidget ??

class MovieCard extends StatelessWidget {
  final String posterPath;
  final String title;
  final String overview;
  final double popularity;
  final List<dynamic> genreIDs;
  final List<dynamic> listGenres;

  MovieCard(
    this.posterPath,
    this.title,
    this.overview,
    this.popularity,
    this.genreIDs,
    this.listGenres,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          // possible refactor: reuse movie_details_poster widget
          Image.network(
            "http://image.tmdb.org/t/p/w500" + posterPath,
            width: 130,
            fit: BoxFit.fitHeight,
            alignment: Alignment.centerLeft,
          ),
          Flexible(
            child: Column(
              children: <Widget>[
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Divider(),
                Flexible(
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(overview, style: TextStyle(), textAlign: TextAlign.justify)
                      )
                    )
                  )
                ),
                Divider(),
                Text("Popularity : " + popularity.toInt().toString()),
                GenresList(genreIDs, listGenres),
              ],
            ),
          )
        ],
      ),
      margin: EdgeInsets.all(3),
    ); 
  }
}