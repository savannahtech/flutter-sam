import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test/main.dart';

void main() {
  testWidgets('Login button is disabled when password field is empty', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    // Verify that the login button is initially disabled
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(tester.widget<ElevatedButton>(find.byType(ElevatedButton)).enabled, isFalse);

    // Enter a value in the username field
    await tester.enterText(find.byKey(const ValueKey('username_field')), 'username');

    // Verify that the login button is still disabled because the password field is empty
    expect(tester.widget<ElevatedButton>(find.byType(ElevatedButton)).enabled, isFalse);
  });

  testWidgets('Login button is enabled when password field is non-empty', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    // Enter a value in the password field
    await tester.enterText(find.byKey(const ValueKey('password_field')), 'password');

    // Verify that the login button is enabled
    expect(tester.widget<ElevatedButton>(find.byType(ElevatedButton)).enabled, isTrue);
  });
}
