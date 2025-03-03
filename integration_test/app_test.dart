import 'package:firebase_series/testing/integration_testing/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:firebase_series/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end to end test', () {
    testWidgets('test Login with correct username and password',
        (tester) async {
      app.main();
      await Future.delayed(Duration(seconds: 5));
      await tester.pumpAndSettle();
      // expect(t, matcher)

      // tester/WidgetTester ---> the  widgetTester is used build and interact with widget in the test environment  

      // pump --> it is used to rebuild the provided widget.
      // pumpAndSettle --> it is used to async/await and nagigation to another page
      // operation that require some time on in the future in that case use pumpAndSettle()

      await Future.delayed(Duration(seconds: 5));
      await tester.enterText(find.byType(TextField).at(0), 'username');
      await Future.delayed(Duration(seconds: 5));
      await tester.enterText(find.byType(TextField).at(1), 'password');
      await Future.delayed(Duration(seconds: 5));
      await tester.tap(find.byType(ElevatedButton));

      await tester.pumpAndSettle();

      await Future.delayed(Duration(seconds: 5));

      expect(find.byType(DashBoardScreen), findsOneWidget);

      await Future.delayed(Duration(seconds: 5));
    });

    testWidgets('Login with incorrect username and password show alert dialog',
        (tester) async {
          app.main();
          await tester.pumpAndSettle();
          await Future.delayed(Duration(seconds: 5));
          await tester.enterText(find.byType(TextField).at(0), 'Suraj');
          await Future.delayed(Duration(seconds: 5));
          await tester.enterText(find.byType(TextField).at(1), 'Omkar');
          await Future.delayed(Duration(seconds: 5));
          await tester.tap(find.byType(ElevatedButton));

          await tester.pumpAndSettle();
          await Future.delayed(Duration(seconds: 5));

          expect(find.byType(AlertDialog), findsOneWidget);

          await tester.tap(find.byType(TextButton));

           await Future.delayed(Duration(seconds: 5));
          await tester.pumpAndSettle();
          expect(find.byType(AlertDialog), findsNothing);
           await Future.delayed(Duration(seconds: 5));
        });
  });
}
