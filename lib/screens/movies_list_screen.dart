import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:myapp/routes.dart';
import 'package:myapp/models/app_state.dart';
import 'package:myapp/models/movie/movie.dart';
import 'package:myapp/models/movie/movie_state.dart';
import 'package:myapp/redux/actions/movie_actions.dart';
import 'package:myapp/screens/movie_details_screen.dart';
import 'package:myapp/components/home_filter_dropdown.dart';
import 'package:myapp/components/home_date_picker.dart';
import 'package:myapp/utils/movie_sorting.dart';
import 'package:myapp/components/movie_card.dart';

class MoviesScreen extends StatefulWidget {

  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  String sortBy;
  DateTime startDate;
  DateTime endDate;

  setSortBy(value) {
    setState(() {
      sortBy = value;
    });
  }

  setDate(startDate, endDate) {
    setState(() {
      startDate = startDate;
      endDate = endDate;
    });
  }

  void handleInitialBuild(MoviesScreenProps props) {
    props.getMovies();
    props.getGenres();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MoviesScreenProps>(
      converter: (store) => mapStateToProps(store),
      onInitialBuild: (props) => this.handleInitialBuild(props),
      builder: (context, props) {
        List<Movie> data = props.listResponse.data;
        List<Genre> listGenres = props.listGenres.data;
        bool listLoading = props.listResponse.loading;
        bool genresLoading = props.listResponse.loading;

        Widget body;

        if (listLoading && genresLoading) {
          body = Center(
            child: CircularProgressIndicator(),
          );
        } else {
          body = ListView.separated(
            padding: const EdgeInsets.all(5.0),
            itemCount: data.length,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (BuildContext context, int i) {
              Movie movie = data[i];

              return InkWell(
                onTap: () {
                  props.getMovieDetails(movie.id);
                  Navigator.pushNamed(context, AppRoutes.movieDetails, arguments: {'title': movie.title});
                },
                child: Container(
                  height: 200,
                  child: MovieCard(
                    movie.posterPath,
                    movie.title,
                    movie.overview,
                    movie.popularity,
                    movie.genreIDs,
                    listGenres,
                  )
                )
              );
            },
          );
        }

        return MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: Text('MovieDB Discover'),
              backgroundColor: Colors.black,
            ),
            body: Scrollbar(
              child: Column(
                children: <Widget>[
                  DropDownButton(setSortBy: setSortBy),
                  DatePicker(setDate: setDate),
                  Expanded(child: body)
                ],
              )
            ),
          ),
          routes: {
            AppRoutes.movieDetails: (context) => MovieDetailsScreen(),
          },
        );
      },
    );
  }
}

class MoviesScreenProps {
  final Function getMovies;
  final ListMoviesState listResponse;
  final Function getGenres;
  final ListGenresState listGenres;
  final Function getMovieDetails;

  MoviesScreenProps({
    this.getMovies,
    this.listResponse,
    this.getGenres,
    this.listGenres,
    this.getMovieDetails,
  });
}

MoviesScreenProps mapStateToProps(Store<AppState> store) {
  return MoviesScreenProps(
    getMovies: () => store.dispatch(getMovies()),
    listResponse: store.state.movie.list,
    getGenres: () => store.dispatch(getGenres()),
    listGenres: store.state.movie.genres,
    getMovieDetails: (int id) => store.dispatch(getMovieDetails(id)),
  );
}