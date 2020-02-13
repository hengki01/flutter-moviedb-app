import 'package:FlutterMovieDBApp/models/app_state.dart';
import 'package:FlutterMovieDBApp/redux/reducers/movie_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    movie: movieReducer(state.movie, action),
  );
}