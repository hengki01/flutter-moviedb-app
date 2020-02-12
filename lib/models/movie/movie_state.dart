import 'package:myapp/models/movie/movie.dart';

class MovieState {
  ListMoviesState list;
  MovieDetailsState details;
  ListGenresState genres;

  MovieState({
    this.list,
    this.details,
    this.genres,
  });

  factory MovieState.initial() => MovieState(
    list: ListMoviesState.initial(),
    details: MovieDetailsState.initial(),
    genres: ListGenresState.initial(),
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
