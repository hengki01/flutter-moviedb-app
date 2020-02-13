import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux_api_middleware/redux_api_middleware.dart';
import 'package:FlutterMovieDBApp/models/app_state.dart';
import 'package:FlutterMovieDBApp/constants/constants.dart';

const LIST_MOVIES_REQUEST = 'LIST_MOVIES_REQUEST';
const LIST_MOVIES_SUCCESS = 'LIST_MOVIES_SUCCESS';
const LIST_MOVIES_FAILURE = 'LIST_MOVIES_FAILURE';

RSAA getMoviesRequest() {
  return
    RSAA(
      method: 'GET',
      endpoint: 'https://api.themoviedb.org/3/discover/movie?api_key=' + Constants.API_KEY,
      types: [
        LIST_MOVIES_REQUEST,
        LIST_MOVIES_SUCCESS,
        LIST_MOVIES_FAILURE,
      ],
      headers: {
        'Content-Type': 'application/json',
      },
    );
}

ThunkAction<AppState> getMovies() => (Store<AppState> store) => store.dispatch(getMoviesRequest());

const GET_MOVIE_DETAILS_REQUEST = 'GET_MOVIE_DETAILS_REQUEST';
const GET_MOVIE_DETAILS_SUCCESS = 'GET_MOVIE_DETAILS_SUCCESS';
const GET_MOVIE_DETAILS_FAILURE = 'GET_MOVIE_DETAILS_FAILURE';

RSAA getMovieDetailsRequest(int id) {
  return
    RSAA(
      method: 'GET',
      endpoint: 'https://api.themoviedb.org/3/movie/$id?api_key=' + Constants.API_KEY,
      types: [
        GET_MOVIE_DETAILS_REQUEST,
        GET_MOVIE_DETAILS_SUCCESS,
        GET_MOVIE_DETAILS_FAILURE,
      ],
      headers: {
        'Content-Type': 'application/json',
      },
    );
}

ThunkAction<AppState> getMovieDetails(int id) => (Store<AppState> store) => store.dispatch(getMovieDetailsRequest(id));

const GET_GENRES_REQUEST = 'GET_GENRES_REQUEST';
const GET_GENRES_SUCCESS = 'GET_GENRES_SUCCESS';
const GET_GENRES_FAILURE = 'GET_GENRES_FAILURE';

RSAA getGenresRequest() {
  return
    RSAA(
      method: 'GET',
      endpoint: 'https://api.themoviedb.org/3/genre/movie/list?language=en-US&api_key=' + Constants.API_KEY,
      types: [
        GET_GENRES_REQUEST,
        GET_GENRES_SUCCESS,
        GET_GENRES_FAILURE,
      ],
      headers: {
        'Content-Type': 'application/json',
      },
    );
}

ThunkAction<AppState> getGenres() => (Store<AppState> store) => store.dispatch(getGenresRequest());

const SEARCH_MOVIES_REQUEST = 'SEARCH_MOVIES_REQUEST';
const SEARCH_MOVIES_SUCCESS = 'SEARCH_MOVIES_SUCCESS';
const SEARCH_MOVIES_FAILURE = 'SEARCH_MOVIES_FAILURE';

RSAA searchMoviesRequest(String query) {
  return
    RSAA(
      method: 'GET',
      endpoint: 'https://api.themoviedb.org/3/search/movie?api_key=' + Constants.API_KEY + '&query=' + query,
      types: [
        SEARCH_MOVIES_REQUEST,
        SEARCH_MOVIES_SUCCESS,
        SEARCH_MOVIES_FAILURE,
      ],
      headers: {
        'Content-Type': 'application/json',
      },
    );
}

ThunkAction<AppState> searchMovies(query) => (Store<AppState> store) => store.dispatch(searchMoviesRequest(query));