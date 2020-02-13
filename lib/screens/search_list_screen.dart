import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart'; 
import 'package:FlutterMovieDBApp/routes.dart';
import 'package:FlutterMovieDBApp/models/app_state.dart';
import 'package:FlutterMovieDBApp/models/movie/movie.dart';
import 'package:FlutterMovieDBApp/models/movie/movie_state.dart';
import 'package:FlutterMovieDBApp/redux/actions/movie_actions.dart';
import 'package:FlutterMovieDBApp/screens/movie_details_screen.dart';

class SearchListScreen extends StatefulWidget {

  @override
  _SearchListScreenState createState() => _SearchListScreenState();
}

class _SearchListScreenState extends State<SearchListScreen> {
  String query;

  void handleQueryChange(SearchListScreenProps props, query) {
    props.searchMovies(query);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    
    return StoreConnector<AppState, SearchListScreenProps>(
      converter: (store) => mapStateToProps(store),
      builder: (context, props) {
        List<Movie> data = props.listSearch.data;
        bool searchLoading = props.listSearch.loading;

        Widget body;

        if (searchLoading) {
          body = Center(
            child: CircularProgressIndicator(),
          );
        } else {
          body = GridView.builder(
            itemCount: data.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              childAspectRatio: (itemWidth / itemHeight),
            ),
            itemBuilder: (BuildContext context, int index) {

              Movie movie = data[index];

              return GridTile(
                child: InkResponse(
                  enableFeedback: true,
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500${data[index].posterPath}',
                    fit: BoxFit.fitWidth,
                  ),
                  onTap: () {
                    props.getMovieDetails(movie.id);
                    Navigator.pushNamed(context, AppRoutes.movieDetails, arguments: {'title': movie.title});
                  },
                ),
              );
            }
          );      
        }

        return MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: Text('MovieDB Search'),
              backgroundColor: Colors.black,
            ),
            body: Scrollbar(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 7),
                  Container(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Search for movies..',
                      ),
                      onSubmitted: (query) {
                        handleQueryChange(props, query);
                      },
                    ),
                  ),
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

class SearchListScreenProps {
  final Function searchMovies;
  final SearchListMoviesState listSearch;
  final Function getMovieDetails;

  SearchListScreenProps({
    this.searchMovies,
    this.listSearch,
    this.getMovieDetails,
  });
}

SearchListScreenProps mapStateToProps(Store<AppState> store) {
  return SearchListScreenProps(
    searchMovies: (query) => store.dispatch(searchMovies(query)),
    listSearch: store.state.movie.search,
    getMovieDetails: (int id) => store.dispatch(getMovieDetails(id)),
  );
}