import 'package:flutter/material.dart';
import 'package:FlutterMovieDBApp/components/movie_details_category_chips.dart';
import 'package:FlutterMovieDBApp/components/movie_details_table_hyperlink.dart';
import 'package:intl/intl.dart';
import 'package:FlutterMovieDBApp/utils/time_converter.dart';

class DetailTable extends StatelessWidget {
  final String releaseDate;
  final int runtime;
  final int revenue;
  final String homepage;
  final double popularity;
  final List<dynamic> productionCompanies;
  final List<dynamic> spokenLanguages;
  final currencyFormatter = NumberFormat("#,##0.00", "en_US");

  DetailTable(
    this.releaseDate,
    this.runtime,
    this.revenue,
    this.homepage,
    this.popularity,
    this.productionCompanies,
    this.spokenLanguages,
  );

  //possible refactor: table-row
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Color.fromRGBO(255, 0, 0, 0.0)),
      children: [
        TableRow(children: [
          Text('Release Date'),
          Text(releaseDate),
        ]),
        TableRow(children: [
          Text('Runtime'),
          Text(timeConverter(runtime)),
        ]),
        TableRow(children: [
          Text('Revenue'),
          Text('USD ${currencyFormatter.format(revenue)}'),
        ]),
        TableRow(children: [
          Text('Movie Homepage'),
          Hyperlink(homepage)
        ]),
        TableRow(children: [
          Text('Popularity'),
          Text(popularity.toInt().toString()),
        ]),
        TableRow(children: [
          Text('Spoken Languages'),
          CategoryChips(spokenLanguages),
        ],),
      ],
    );
  }
}