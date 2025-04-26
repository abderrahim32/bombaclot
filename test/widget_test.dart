import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:carapp/main.dart';

void main() {
  testWidgets('CarApp widget smoke test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const CarApp());

    // Verify that a Scaffold exists in the widget tree.
    expect(find.byType(Scaffold), findsWidgets);

    // Verify that our login page contains the expected welcome text.
    expect(find.text('Welcome!'), findsOneWidget);
  });
}
