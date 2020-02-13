import 'package:FlutterMovieDBApp/models/movie/movie.dart';

List<Movie> dateFilter(sortedData, startDate, endDate) {
  List<Movie> filteredData = [];

  if(startDate != null && endDate != null) {
    
    for(var item in sortedData) {
      DateTime releaseDate = DateTime.parse(item.releaseDate);

      if(releaseDate.isAfter(startDate) && releaseDate.isBefore(endDate)) {
        filteredData.add(item);
      }
    }
  } else {
    return sortedData;
  }

  return filteredData;
}