import 'package:flutter/material.dart';
import 'package:FlutterMovieDBApp/models/movie/movie.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:FlutterMovieDBApp/models/app_state.dart';
import 'package:FlutterMovieDBApp/models/movie/movie_state.dart';
import 'package:FlutterMovieDBApp/components/movie_details_header.dart';
import 'package:FlutterMovieDBApp/components/movie_details_overview.dart';
import 'package:FlutterMovieDBApp/components/movie_details_logo_scroller.dart';
import 'package:FlutterMovieDBApp/utils/logo_url_extractor.dart';
import 'package:FlutterMovieDBApp/components/movie_details_table.dart';

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
                LogoScroller(logoUrlsExtractor(data.productionCompanies)),
                SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: DetailTable(
                    data.releaseDate,
                    data.runtime,
                    data.revenue,
                    data.homepage,
                    data.popularity,
                    data.productionCompanies,
                    data.spokenLanguages
                  ),
                )
              ],
            ),
          );
        }

        return Scaffold(
          backgroundColor: Colors.grey[180],
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Color(0x00000000),
            elevation: 0,
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