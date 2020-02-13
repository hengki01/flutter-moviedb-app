// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:FlutterMovieDBApp/main.dart';

void main() {
  testWidgets('AppWidget renders icons & text in bottom tab navigation correctly', (WidgetTester tester) async {
    
    await tester.pumpWidget(App());

    expect(find.byType(BottomNavigationBar), findsOneWidget);
    expect(find.text('Discover'), findsOneWidget);
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.text('Search'), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.text('Favourites'), findsOneWidget);
    expect(find.byIcon(Icons.star), findsOneWidget);
  });
}
