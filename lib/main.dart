import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:FlutterMovieDBApp/screens/movies_list_screen.dart';
import 'package:FlutterMovieDBApp/redux/store.dart';
import 'package:FlutterMovieDBApp/screens/favourites_list_screen.dart';
import 'package:FlutterMovieDBApp/screens/search_list_screen.dart';
import 'package:FlutterMovieDBApp/constants/constants.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: Constants.APP_NAME,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: const Color(0xFFFF5959),
        ),
        home: AppNavigation(),
      ),
    );
  }
}

class AppNavigation extends StatefulWidget {
  AppNavigation({Key key}) : super(key: key);

  @override
  _AppNavigationState createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    MoviesScreen(),
    SearchListScreen(),
    FavouritesListScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //possible refactor: bottomnavigationitem
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list, color: Colors.black),
            title: Text('Discover'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.black),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.pink),
            title: Text('Favourites'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}