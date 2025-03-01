import 'package:firebase_series/testing/widgets_testing/animation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('animation page ...', (tester) async {
    // TODO: Implement test

    await tester.pumpWidget(const MaterialApp(home: AnimationPage()));

    // pumpWidget --> Add Screen for the testing
    expect(find.byType(Container), findsOneWidget);
    expect(find.byType(Center),findsOneWidget);

    // find.byType --> search widgte on the selected screen 

    final container = tester.widget<Container>(find.byType(Container));
    // initial 

    // tester --> return widget
    // T --> means Type /// Data type or Widget type

    expect(container.constraints!.maxWidth, 0);
    expect(container.constraints!.maxHeight, 0);

    final boxDec = container.decoration as BoxDecoration;
    expect(boxDec.color, Colors.blue);
    expect(boxDec.borderRadius, BorderRadius.zero);

    //final
    

    await tester.pumpAndSettle();


    // pumpAndSettle --> waiting for the animation complete
    final container2 = tester.widget<Container>(find.byType(Container));

    expect(container2.constraints!.maxWidth, 200);
    expect(container2.constraints!.maxHeight, 200);

    final boxDec2 = container2.decoration as BoxDecoration;

    expect(boxDec2.color, Colors.green);
    expect(boxDec2.borderRadius, BorderRadius.circular(50));


  });
}
