import 'package:FlutterMovieDBApp/models/movie/movie.dart';

List<Movie> movieSorting(movieList, sortBy) {
  switch (sortBy) {
    case 'popularity-asc':
      movieList.sort((Movie a, Movie b) => b.popularity.compareTo(a.popularity));
      return movieList;
    case 'popularity-desc':
      movieList.sort((Movie a, Movie b) => a.popularity.compareTo(b.popularity));
      return movieList;
    case 'votecount-asc':
      movieList.sort((Movie a, Movie b) => b.voteCount.compareTo(a.voteCount));
      return movieList;
    case 'votecount-desc':
      movieList.sort((Movie a, Movie b) => a.voteCount.compareTo(b.voteCount));
      return movieList;
    case 'releasedate-asc':
      movieList.sort((Movie a, Movie b) => b.releaseDate.compareTo(a.releaseDate));
      return movieList;
    case 'releasedate-desc':
      movieList.sort((Movie a, Movie b) => a.releaseDate.compareTo(b.releaseDate));
      return movieList;
    default :
      return movieList;
  }
}