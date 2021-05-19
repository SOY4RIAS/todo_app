import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/main.dart';

void main() {
  testWidgets('Check Todo', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    await tester.tap(find.byIcon(Icons.pending_actions).first);
    await tester.pump();

    expect(find.byIcon(Icons.check), findsOneWidget);
  });
}
