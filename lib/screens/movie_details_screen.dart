import 'package:flutter/material.dart';
import 'package:myapp/models/movie/movie.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:myapp/models/app_state.dart';
import 'package:myapp/models/movie/movie_state.dart';
import 'package:myapp/components/movie_details_header.dart';
import 'package:myapp/components/movie_details_overview.dart';
import 'package:myapp/components/movie_details_table.dart';

class MovieDetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MovieDetailsScreenProps>(
      converter: (store) => mapStateToProps(store),
      builder: (context, props) {
        MovieDetails data = props.detailsResponse.data;
        bool loading = props.detailsResponse.loading;

        Widget body;
        if (loading) {
          body = Center(
            child: CircularProgressIndicator(),
          );
        } else {
          body = SingleChildScrollView(
            child: Column(
              children: [
                MovieDetailHeader(
                  data.backdropPath,
                  data.posterPath,
                  data.overview,
                  data.popularity,
                  data.genres,
                  data.voteAverage,
                  data.title,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Overview(data.overview),
                ),
                // PhotoScroller(movie.photoUrls),
                SizedBox(height: 20.0),
                // ActorScroller(movie.actors),
                SizedBox(height: 50.0),
                DetailTable(
                  data.releaseDate,
                  data.runtime,
                  data.revenue,
                  data.homepage,
                  data.popularity,
                  data.productionCompanies,
                  data.spokenLanguages
                ),
              ],
            ),
          );
        }

        return Scaffold(
          backgroundColor: Colors.grey[300],
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Color(0x44000000),
            elevation: 0,
            centerTitle: true,
            title: Text("Movie Details"),
          ),
          body: Scrollbar(child: body),
        );
      },
    );
  }
}

class MovieDetailsScreenProps {
  final MovieDetailsState detailsResponse;

  MovieDetailsScreenProps({
    this.detailsResponse,
  });
}

MovieDetailsScreenProps mapStateToProps(Store<AppState> store) {
  return MovieDetailsScreenProps(
    detailsResponse: store.state.movie.details,
  );
}