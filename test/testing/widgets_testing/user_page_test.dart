import 'package:firebase_series/testing/unit_test/user_model.dart';
import 'package:firebase_series/testing/widgets_testing/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('', (tester) async {

      // 
      List<User> users = [
        User(id: 1, name: 'Suraj Phadtare', email: 'suraj007phadtare@gmail.com'),
        User(id: 2, name: 'Omkar Late', email: 'onkarlate@gmail.com')
      ];

      // users.add(User(id: 1, name: 'Suraj Phadtare', email: 'suraj007phadtare@gmail.com'));
      // users.add(User(id: 2, name: 'Omkar Late', email: 'onkarlate@gmail.com'));

      Future<List<User>> getFutureList() async {
       return Future.delayed(Duration(seconds:1 ), () => Future.value(users));
       // return Future.value(users);
      }

    // 
    await tester.pumpWidget( MaterialApp(home: UserPage(repository: getFutureList()),));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    //tester.
    await tester.pumpAndSettle();
    expect(find.byType(ListTile), findsNWidgets(users.length));

    for(var user in users){
      expect(find.text(user.name), findsOneWidget);
      expect(find.text(user.email), findsOneWidget);
    }
    // pump --> only rebuild UI ---> not wait for it complete
    // pumpAndSettle --> rebuild UI and wait to the complete the widgets and then set it
  });
}