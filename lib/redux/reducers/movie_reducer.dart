import 'dart:convert';
import 'package:redux_api_middleware/redux_api_middleware.dart';
import 'package:FlutterMovieDBApp/redux/actions/movie_actions.dart';
import 'package:FlutterMovieDBApp/models/movie/movie.dart';
import 'package:FlutterMovieDBApp/models/movie/movie_state.dart';

MovieState movieReducer(MovieState state, FSA action) {
  MovieState newState = state;

  switch (action.type) {
    case LIST_MOVIES_REQUEST:
      newState.list.error = null;
      newState.list.loading = true;
      newState.list.data = null;
      return newState;

    case LIST_MOVIES_SUCCESS:
      newState.list.error = null;
      newState.list.loading = false;
      newState.list.data = moviesFromJSONStr(action.payload);
      return newState;

    case LIST_MOVIES_FAILURE:
      newState.list.error = action.payload;
      newState.list.loading = false;
      newState.list.data = null;
      return newState;

    case GET_MOVIE_DETAILS_REQUEST:
      newState.details.error = null;
      newState.details.loading = true;
      newState.details.data = null;
      return newState;

    case GET_MOVIE_DETAILS_SUCCESS:
      newState.details.error = null;
      newState.details.loading = false;
      newState.details.data = movieFromJSONStr(action.payload);
      return newState;

    case GET_MOVIE_DETAILS_FAILURE:
      newState.details.error = action.payload;
      newState.details.loading = false;
      newState.details.data = null;
      return newState;

    case GET_GENRES_REQUEST:
      newState.genres.error = null;
      newState.genres.loading = true;
      newState.genres.data = null;
      return newState;

    case GET_GENRES_SUCCESS:
      newState.genres.error = null;
      newState.genres.loading = false;
      newState.genres.data = genresFromJSONStr(action.payload);
      return newState;

    case GET_GENRES_FAILURE:
      newState.genres.error = action.payload;
      newState.genres.loading = false;
      newState.genres.data = null;
      return newState;

    case SEARCH_MOVIES_REQUEST:
      newState.search.error = null;
      newState.search.loading = true;
      newState.search.data = null;
      return newState;

    case SEARCH_MOVIES_SUCCESS:
      newState.search.error = null;
      newState.search.loading = false;
      newState.search.data = moviesFromJSONStr(action.payload);
      return newState;

    case SEARCH_MOVIES_FAILURE:
      newState.search.error = action.payload;
      newState.search.loading = false;
      newState.search.data = null;
      return newState;

    default:
      return newState;
  }
}

List<Movie> moviesFromJSONStr(dynamic payload) {
  var jsonArray = json.decode(payload);
  return (jsonArray['results'] as List).map((j) => Movie.fromJSON(j)).toList();
}

MovieDetails movieFromJSONStr(dynamic payload) {
  return MovieDetails.fromJSON(json.decode(payload));
}

List<Genre> genresFromJSONStr(dynamic payload) {
  var jsonArray = json.decode(payload);
  return (jsonArray['genres'] as List).map((j) =>Genre.fromJSON(j)).toList();
}