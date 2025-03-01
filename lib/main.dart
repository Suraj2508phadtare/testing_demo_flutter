import 'package:firebase_series/testing/unit_test/user_repository.dart';
import 'package:firebase_series/testing/widgets_testing/animation_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'testing/integration_testing/login_page.dart';
import 'testing/widgets_testing/user_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AnimationPage(),
       // UserPage(repository:Repository(http.Client()).getUserData()),
    );
  }
}
