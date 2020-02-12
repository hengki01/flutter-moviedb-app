import 'package:myapp/models/app_state.dart';
import 'package:myapp/redux/reducers/movie_reducer.dart';
import 'package:myapp/redux/reducers/filter_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    movie: movieReducer(state.movie, action),
    // filter: filterReducer(state.filter, action),
  );
}