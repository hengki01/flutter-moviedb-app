import 'package:FlutterMovieDBApp/models/movie/movie.dart';

class MovieState {
  ListMoviesState list;
  MovieDetailsState details;
  ListGenresState genres;
  SearchListMoviesState search;

  MovieState({
    this.list,
    this.details,
    this.genres,
    this.search
  });

  factory MovieState.initial() => MovieState(
    list: ListMoviesState.initial(),
    details: MovieDetailsState.initial(),
    genres: ListGenresState.initial(),
    search: SearchListMoviesState.initial(),
  );
}

class ListMoviesState {
  dynamic error;
  bool loading;
  List<Movie> data;

  ListMoviesState({
    this.error,
    this.loading,
    this.data,
  });

  factory ListMoviesState.initial() => ListMoviesState(
    error: null,
    loading: false,
    data: [],
  );
}

class MovieDetailsState {
  dynamic error;
  bool loading;
  MovieDetails data;

  MovieDetailsState({
    this.error,
    this.loading,
    this.data,
  });

  factory MovieDetailsState.initial() => MovieDetailsState(
    error: null,
    loading: false,
    data: null,
  );
}

class ListGenresState {
  dynamic error;
  bool loading;
  List<Genre> data;

  ListGenresState({
    this.error,
    this.loading,
    this.data,
  });

  factory ListGenresState.initial() => ListGenresState(
    error: null,
    loading: false,
    data: null,
  );
}

class SearchListMoviesState {
  dynamic error;
  bool loading;
  List<Movie> data;

  SearchListMoviesState({
    this.error,
    this.loading,
    this.data,
  });

  factory SearchListMoviesState.initial() => SearchListMoviesState(
    error: null,
    loading: false,
    data: [],
  );
}
