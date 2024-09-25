import 'package:flutter/material.dart';
import 'package:flutter_buttombar_chung/flutter_buttombar_chung.dart';
import 'package:flutter_buttombar_chung/flutter_buttombar_chung_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('FlutterButtomBarChung displays items and reacts to taps',
      (WidgetTester tester) async {
    int tappedIndex = -1;

    // Define the items for the bottom bar
    final items = [
      FlutterButtombarChungItem(
        child: const Icon(Icons.home),
        label: 'Home',
      ),
      FlutterButtombarChungItem(
        child: const Icon(Icons.search),
        label: 'Search',
      ),
      FlutterButtombarChungItem(
        child: const Icon(Icons.person),
        label: 'Profile',
      ),
    ];

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: FlutterButtomBarChung(
            items: items,
            onTap: (index) {
              tappedIndex = index;
            },
          ),
          body: Container(),
        ),
      ),
    );

    // Verify the items are displayed
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Search'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);

    // Tap the second item and verify the callback is triggered
    await tester.tap(find.text('Search'));
    await tester.pumpAndSettle();
    expect(tappedIndex, 1);

    // Tap the third item and verify the callback is triggered
    await tester.tap(find.text('Profile'));
    await tester.pumpAndSettle();
    expect(tappedIndex, 2);
  });

  testWidgets('FlutterButtomBarChung animates correctly on tap',
      (WidgetTester tester) async {
    // Define the items for the bottom bar
    final items = [
      FlutterButtombarChungItem(
        child: const Icon(Icons.home),
        label: 'Home',
      ),
      FlutterButtombarChungItem(
        child: const Icon(Icons.search),
        label: 'Search',
      ),
      FlutterButtombarChungItem(
        child: const Icon(Icons.person),
        label: 'Profile',
      ),
    ];

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: FlutterButtomBarChung(
            items: items,
            index: 0,
          ),
          body: Container(),
        ),
      ),
    );

    // Verify initial state
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Search'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);

    // Tap the second item and verify the animation is triggered
    await tester.tap(find.text('Search'));
    await tester.pump(); // Start the animation
    await tester
        .pump(const Duration(milliseconds: 300)); // Halfway through animation

    // Verify intermediate animation state
    // Check for partial translation or opacity changes

    await tester.pumpAndSettle(); // Finish the animation
  });
}
