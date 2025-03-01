import 'package:firebase_series/testing/widgets_testing/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  // given when then
  testWidgets('The given counter is 0 when the incremnet is called then ther counter is 1.', (tester) async {
    //
    await tester.pumpWidget(
      const MaterialApp(home: CounterPage())
    );
    // pumpWidget --> renders the UI from from given UI
   final ctr1 = find.text('0');
   // find is used to serach widget on the screen

   expect(ctr1, findsOneWidget);
   // findOneWidget is used  to check one widget is Present on the Screen
   // FindsNothing --> Check --> no widget Present on the Screen
   final ctr2 = find.text('1');
   expect(ctr2, findsNothing);

   await tester.tap(find.byKey(Key('increment')));
   await tester.pump();

   // pump --> update the UI and Rebuild the UI
   // pumpAndSettle --> update the UI and Rebuild the UI and wait for the animation to complete
   final ctr3 = find.text('1');
   expect(ctr3, findsOneWidget);

   final ctr4 = find.text('0');
   expect(ctr4, findsNothing);

   expect(find.byType(AppBar), findsOneWidget);

   final ctr5 = find.text('Unit Testing');
   expect(ctr5, findsOneWidget);


  });
}