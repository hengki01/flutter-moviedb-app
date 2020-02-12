import 'package:flutter/material.dart';

class DetailTable extends StatelessWidget {
  final String releaseDate;
  final int runtime;
  final int revenue;
  final String homepage;
  final double popularity;
  final List<dynamic> productionCompanies;
  final List<dynamic> spokenLanguages;

  DetailTable(
    this.releaseDate,
    this.runtime,
    this.revenue,
    this.homepage,
    this.popularity,
    this.productionCompanies,
    this.spokenLanguages,
  );

  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.black),
      children: [
        TableRow(children: [
          Text('Release Date'),
          Text(releaseDate),
        ]),
        TableRow(children: [
          Text('Runtime'),
          Text(runtime.toString() + " minutes"),
        ]),
        TableRow(children: [
          Text('Revenue'),
          Text(revenue.toString()),
        ]),
        TableRow(children: [
          Text('Movie Homepage'),
          Text(homepage),
        ]),
        TableRow(children: [
          Text('Popularity'),
          Text(popularity.toString()),
        ]),
        TableRow(children: [
          Text('Production Companies'),
          Text(productionCompanies.toString()),
        ]),
        TableRow(children: [
          Text('Spoken Languages'),
          Text(spokenLanguages.toString()),
        ]),
      ],
    );
  }
}