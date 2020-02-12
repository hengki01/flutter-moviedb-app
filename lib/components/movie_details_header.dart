import 'package:flutter/material.dart';
import 'package:myapp/components/movie_details_backdrop_image.dart';
import 'package:myapp/components/movie_details_poster.dart';
import 'package:myapp/components/movie_details_star_rating_container.dart';

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

  // 
  List<Widget> _buildCategoryChips(TextTheme textTheme) {
    return genres.map((category) {
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Chip(
          label: Text(
            category["name"],
            style: TextStyle(color: Colors.white),
          ),
          labelStyle: textTheme.caption,
          backgroundColor: Colors.black,
        ),
      );
    }).toList();
  }

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
          child: Row(
            children: _buildCategoryChips(textTheme)
          )
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