import 'package:flutter_buttombar_chung/flutter_buttombar_chung_item.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('flutter_buttombar_chung displays correct number of items', (WidgetTester tester) async {
    // Create a list of items
    final items = [
      FlutterButtombarChungItem(icon: Icons.home, label: 'Home'),
      FlutterButtombarChungItem(icon: Icons.search, label: 'Search'),
      FlutterButtombarChungItem(icon: Icons.person, label: 'Profile'),
    ];

    // Build the flutter_buttombar_chung widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: FlutterButtombarChungItem(items: items),
        ),
      ),
    );

    // Expect to find the correct number of items
    expect(find.byType(Icon), findsNWidgets(items.length));
  });
}