import 'package:meta/meta.dart';
import 'package:myapp/models/movie/movie_state.dart';
import 'package:myapp/models/filter/filter_state.dart';

@immutable
class AppState {
  final MovieState movie;
  final FilterState filter;

  AppState({
    this.movie,
    this.filter,
  });

  factory AppState.initial() => AppState(
    movie: MovieState.initial(),
    filter: FilterState.initial(),
  );

  AppState copyWith({
    MovieState movie,
    FilterState filter,
  }) {
    return AppState(
      movie : movie ?? this.movie,
      filter : filter ?? this.filter,
    );
  }
}