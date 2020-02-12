class Movie {
  final int id;
  final String posterPath;
  final String title;
  final String overview;
  final double popularity;
  final List<dynamic> genreIDs;
  final String releaseDate;
  final int voteCount;

  Movie({
    this.id,
    this.posterPath,
    this.title,
    this.overview,
    this.popularity,
    this.genreIDs,
    this.releaseDate,
    this.voteCount,
  });

  factory Movie.fromJSON(Map<String, dynamic> json) => Movie(
    id: json['id'] as int,
    posterPath: json['poster_path'] as String,
    title: json['title'] as String,
    overview: json['overview'] as String,
    popularity: json['popularity'] as double,
    genreIDs: json['genre_ids'] as List<dynamic>,
    releaseDate: json['release_date'] as String,
    voteCount: json['vote_count'] as int
  );
}

class MovieDetails {
  final String backdropPath;
  final String posterPath;
  final String overview;
  final double popularity;
  final List<dynamic> genres;
  final String releaseDate;
  final String homepage;
  final List<dynamic> productionCompanies;
  final int runtime;
  final int revenue;
  final double voteAverage;
  final List<dynamic> spokenLanguages;
  final String title;

  MovieDetails({
    this.backdropPath,
    this.posterPath,
    this.overview,
    this.popularity,
    this.genres,
    this.releaseDate,
    this.homepage,
    this.productionCompanies,
    this.runtime,
    this.revenue,
    this.voteAverage,
    this.spokenLanguages,
    this.title,
  });

  factory MovieDetails.fromJSON(Map<String, dynamic> json) => MovieDetails(
    backdropPath: json['backdrop_path'] as String,
    posterPath: json['poster_path'] as String,
    overview: json['overview'] as String,
    popularity: json['popularity'] as double,
    genres: json['genres'] as List<dynamic>,
    releaseDate: json['release_date'] as String,
    homepage: json['homepage'] as String,
    productionCompanies: json['production_companies'] as List<dynamic>,
    runtime: json['runtime'] as int,
    revenue: json['revenue'] as int,
    voteAverage: json['vote_average'] as double,
    spokenLanguages: json['spoken_languages'] as List<dynamic>,
    title: json['original_title'] as String,
  );
}

class Genre {
  final int id;
  final String name;

  Genre({
    this.id,
    this.name,
  });

  factory Genre.fromJSON(Map<String, dynamic> json) => Genre(
    id: json['id'] as int,
    name: json['name'] as String
  );
}