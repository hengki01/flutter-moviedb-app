// import 'dart:convert';

// import 'package:myapp/models/search_result.dart';
// import 'package:http/http.dart' as http;
// import 'package:myapp/utils/constants.dart';

// class MovieDB {
//   final String baseUrl;

//   MovieDB({
//     this.baseUrl = Constants.BASE_URL
//   });

//   Future<SearchResult> fetchSearchResults(String term) async {
//     // final uri = Uri.parse("${baseUrl}search.json?q=$term");
//     final uri = baseUrl
//     final response = await http.get(uri);
//     print(response)
//     return SearchResult.fromJson(json.decode(response.body));
//   }
// }