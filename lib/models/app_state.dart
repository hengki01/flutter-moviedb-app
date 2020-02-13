import 'package:meta/meta.dart';
import 'package:FlutterMovieDBApp/models/movie/movie_state.dart';

@immutable
class AppState {
  final MovieState movie;

  AppState({
    this.movie,
  });

  factory AppState.initial() => AppState(
    movie: MovieState.initial(),
  );

  AppState copyWith({
    MovieState movie,
  }) {
    return AppState(
      movie : movie ?? this.movie,
    );
  }
}