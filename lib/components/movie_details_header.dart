import 'package:flutter/material.dart';
import 'package:FlutterMovieDBApp/components/movie_details_backdrop_image.dart';
import 'package:FlutterMovieDBApp/components/movie_details_poster.dart';
import 'package:FlutterMovieDBApp/components/movie_details_star_rating_container.dart';
import 'package:FlutterMovieDBApp/components/movie_details_category_chips.dart';

class MovieDetailHeader extends StatelessWidget {
  final String backdropPath;
  final String posterPath;
  final String overview;
  final double popularity;
  final List<dynamic> genres;
  final double voteAverage;
  final String title;

  MovieDetailHeader(
    this.backdropPath,
    this.posterPath,
    this.overview,
    this.popularity,
    this.genres,
    this.voteAverage,
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    var movieInformation = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.title,
        ),
        SizedBox(height: 8.0),
        StarRatingContainer(voteAverage),
        SizedBox(height: 8.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: CategoryChips(genres)
        )
      ],
    );

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 140.0),
          child: BackdropImage(backdropPath),
        ),
        Positioned(
          bottom: 0.0,
          left: 20.0,
          right: 0.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Poster(
                posterPath,
                height: 180.0,
              ),
              SizedBox(width: 16.0),
              Expanded(child: movieInformation),
            ],
          ),
        ),
      ],
    );
  }
}